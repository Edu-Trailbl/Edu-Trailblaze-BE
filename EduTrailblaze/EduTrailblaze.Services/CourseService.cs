﻿using AutoMapper;
using EduTrailblaze.Entities;
using EduTrailblaze.Repositories.Interfaces;
using EduTrailblaze.Services.DTOs;
using EduTrailblaze.Services.Helper;
using EduTrailblaze.Services.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace EduTrailblaze.Services
{
    public class CourseService : ICourseService
    {
        private readonly IRepository<Course, int> _courseRepository;
        private readonly IRepository<CourseInstructor, int> _courseInstructorRepository;
        private readonly IRepository<Enrollment, int> _enrollmentRepository;
        private readonly IRepository<Coupon, int> _couponRepository;
        private readonly IReviewService _reviewService;
        private readonly UserManager<User> _userManager;
        private readonly IElasticsearchService _elasticsearchService;
        private readonly IDiscountService _discountService;
        private readonly IMapper _mapper;

        public CourseService(IRepository<Course, int> courseRepository, IReviewService reviewService, IElasticsearchService elasticsearchService, IMapper mapper, IDiscountService discountService, IRepository<CourseInstructor, int> courseInstructorRepository, IRepository<Enrollment, int> enrollment, UserManager<User> userManager)
        {
            _courseRepository = courseRepository;
            _reviewService = reviewService;
            _elasticsearchService = elasticsearchService;
            _mapper = mapper;
            _discountService = discountService;
            _courseInstructorRepository = courseInstructorRepository;
            _enrollmentRepository = enrollment;
            _userManager = userManager;
        }

        public async Task<Course?> GetCourse(int courseId)
        {
            try
            {
                return await _courseRepository.GetByIdAsync(courseId);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the course.", ex);
            }
        }

        public async Task<IEnumerable<Course>> GetCourses()
        {
            try
            {
                return await _courseRepository.GetAllAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the course.", ex);
            }
        }

        public async Task AddCourse(Course course)
        {
            try
            {
                await _courseRepository.AddAsync(course);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the course.", ex);
            }
        }

        public async Task AddCourse(CreateCourseRequest req)
        {
            try
            {
                var instructor = await _userManager.FindByIdAsync(req.CreatedBy);

                if (instructor == null)
                {
                    throw new ArgumentException("Invalid instructor ID");
                }

                var newCourse = new Course
                {
                    Title = req.Title,
                    ImageURL = req.ImageURL,
                    Description = req.Description,
                    Price = req.Price,
                    CreatedBy = req.CreatedBy,
                    DifficultyLevel = req.DifficultyLevel,
                    Prerequisites = req.Prerequisites,
                    UpdatedBy = req.CreatedBy,

                    CourseInstructors = new List<CourseInstructor>
                    {
                        new CourseInstructor
                        {
                            InstructorId = instructor.Id,
                            IsPrimaryInstructor = true
                        }
                    }
                };

                await _courseRepository.AddAsync(newCourse);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the course: " + ex.Message);
            }
        }

        public async Task UpdateCourse(UpdateCourseRequest req)
        {
            try
            {
                var course = await _courseRepository.GetByIdAsync(req.CourseId);
                if (course == null)
                {
                    throw new ArgumentException("Invalid course ID");
                }

                var instructor = await _userManager.FindByIdAsync(req.UpdatedBy);

                // check if the instructor has permission to update the course
                var courseInstructorDbSet = await _courseInstructorRepository.GetDbSet();
                var isCourseInstructor = await courseInstructorDbSet.AnyAsync(ci => ci.CourseId == req.CourseId && ci.InstructorId == instructor.Id);

                if (!isCourseInstructor)
                {
                    throw new Exception("Instructor does not have permission to update the course.");
                }

                var newCourse = new Course
                {
                    CourseId = req.CourseId,
                    Title = req.Title,
                    ImageURL = req.ImageURL,
                    Description = req.Description,
                    Price = req.Price,
                    Duration = course.Duration,
                    DifficultyLevel = req.DifficultyLevel,
                    Prerequisites = req.Prerequisites,
                    EstimatedCompletionTime = course.EstimatedCompletionTime,
                    CreatedAt = course.CreatedAt,
                    UpdatedAt = DateTimeHelper.GetVietnamTime(),
                    CreatedBy = course.CreatedBy,
                    UpdatedBy = req.UpdatedBy,
                    IsPublished = req.IsPublished,
                    IsDeleted = req.IsDeleted
                };

                await _courseRepository.UpdateAsync(newCourse);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the course: " + ex.Message);
            }
        }

        public async Task UpdateCourse(Course course)
        {
            try
            {
                await _courseRepository.UpdateAsync(course);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the course.", ex);
            }
        }

        public async Task DeleteCourse(Course course)
        {
            try
            {
                await _courseRepository.DeleteAsync(course);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the course.", ex);
            }
        }

        public async Task DeleteCourse(int courtId)
        {
            try
            {
                var course = await _courseRepository.GetByIdAsync(courtId);

                if (course == null)
                {
                    throw new ArgumentException("Invalid course ID");
                }

                course.IsDeleted = true;

                await _courseRepository.UpdateAsync(course);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the course.", ex);
            }
        }

        public async Task<decimal> CalculateEffectivePrice(int courseId)
        {
            var dbSet = await _courseRepository.GetDbSet();

            var course = await dbSet
                .Include(c => c.CourseDiscounts)
                .ThenInclude(cd => cd.Discount)
                .FirstOrDefaultAsync(c => c.CourseId == courseId);

            if (course == null)
            {
                throw new ArgumentException("Invalid course ID");
            }

            var effectivePrice = course.Price;
            if (course.CourseDiscounts.Any())
            {
                var maxDiscount = course.CourseDiscounts
                    .Where(d => d.Discount.IsActive &&
                                d.Discount.StartDate <= DateTimeHelper.GetVietnamTime() &&
                                d.Discount.EndDate >= DateTimeHelper.GetVietnamTime())
                    .Max(d => d.Discount.DiscountType == "Percentage"
                        ? course.Price * d.Discount.DiscountValue / 100
                        : d.Discount.DiscountValue);

                effectivePrice -= maxDiscount;
            }

            return effectivePrice;
        }

        public async Task<int?> GetMaxDiscountId(int courseId)
        {
            var dbSet = await _courseRepository.GetDbSet();

            var course = await dbSet
                .Include(c => c.CourseDiscounts)
                .ThenInclude(cd => cd.Discount)
                .FirstOrDefaultAsync(c => c.CourseId == courseId);

            if (course == null)
            {
                throw new ArgumentException("Invalid course ID");
            }

            var maxDiscount = course.CourseDiscounts
                .Where(d => d.Discount.IsActive &&
                            d.Discount.StartDate <= DateTimeHelper.GetVietnamTime() &&
                            d.Discount.EndDate >= DateTimeHelper.GetVietnamTime())
                .OrderByDescending(d => d.Discount.DiscountType == "Percentage"
                    ? course.Price * d.Discount.DiscountValue / 100
                    : d.Discount.DiscountValue)
                .FirstOrDefault();

            return maxDiscount?.DiscountId;
        }

        public async Task<List<CourseDTO>?> GetCoursesByConditions(GetCoursesRequest request)
        {
            try
            {
                var dbSet = await _courseRepository.GetDbSet();

                if (request.IsDeleted != null)
                {
                    dbSet = dbSet.Where(c => c.IsDeleted == request.IsDeleted);
                }

                if (request.IsPublished != null)
                {
                    dbSet = dbSet.Where(c => c.IsPublished == request.IsPublished);
                }

                if (request.TagId != null)
                {
                    dbSet = dbSet.Where(c => c.CourseTags.Any(t => t.TagId == request.TagId));
                }

                if (request.InstructorId != null)
                {
                    dbSet = dbSet.Where(c => c.CourseInstructors.Any(t => t.InstructorId == request.InstructorId));
                }

                if (request.LanguageId != null)
                {
                    dbSet = dbSet.Where(c => c.CourseLanguages.Any(t => t.LanguageId == request.LanguageId));
                }

                if (request.MinRating != null)
                {
                    dbSet = dbSet.Where(c => c.Reviews.Any() && c.Reviews.Average(r => r.Rating) >= request.MinRating);
                }

                if (request.MaxRating != null)
                {
                    dbSet = dbSet.Where(c => c.Reviews.Any() && c.Reviews.Average(r => r.Rating) <= request.MaxRating);
                }

                if (request.MinDuration != null)
                {
                    dbSet = dbSet.Where(c => c.Duration >= request.MinDuration);
                }

                if (request.MaxDuration != null)
                {
                    dbSet = dbSet.Where(c => c.Duration <= request.MaxDuration);
                }

                if (request.HasQuizzes == true)
                {
                    dbSet = dbSet.Where(c => c.Sections.Any(s => s.Lectures.Any(l => l.Quizzes.Count != 0)));
                }

                if (request.DifficultyLevel != null)
                {
                    dbSet = dbSet.Where(c => c.DifficultyLevel == request.DifficultyLevel);
                }

                if (request.IsFree == true)
                {
                    dbSet = dbSet.Where(c => c.Price == 0);
                }

                var items = await dbSet.ToListAsync();

                if (request.MinPrice.HasValue || request.MaxPrice.HasValue)
                {
                    items = items
                        .Select(c => new
                        {
                            Course = c,
                            EffectivePrice = CalculateEffectivePrice(c.CourseId).Result
                        })
                        .Where(x =>
                            (!request.MinPrice.HasValue || x.EffectivePrice >= request.MinPrice) &&
                            (!request.MaxPrice.HasValue || x.EffectivePrice <= request.MaxPrice)
                        )
                        .Select(x => x.Course)
                        .ToList();
                }

                //var items = await dbSet
                //        .Include(c => c.CourseDiscounts)
                //        .ThenInclude(cd => cd.Discount)
                //        .ToListAsync();

                //if (request.MinPrice.HasValue || request.MaxPrice.HasValue)
                //{
                //    items = items
                //        .Select(c => new
                //        {
                //            Course = c,
                //            MaxDiscount = c.CourseDiscounts
                //                .Where(d => d.Discount.IsActive &&
                //                            d.Discount.StartDate <= DateTime.UtcNow &&
                //                            d.Discount.EndDate >= DateTime.UtcNow)
                //                .Select(d => d.Discount.DiscountType == "Percentage"
                //                    ? c.Price * d.Discount.DiscountValue / 100
                //                    : d.Discount.DiscountValue)
                //                .DefaultIfEmpty(0m) // Handle courses with no valid discounts
                //                .Max()
                //        })
                //        .Where(x =>
                //            (!request.MinPrice.HasValue || (x.Course.Price - x.MaxDiscount) >= request.MinPrice) &&
                //            (!request.MaxPrice.HasValue || (x.Course.Price - x.MaxDiscount) <= request.MaxPrice)
                //        )
                //        .Select(x => x.Course)
                //        .ToList();
                //}

                var courseDTOs = _mapper.Map<List<CourseDTO>>(items);

                if (!string.IsNullOrEmpty(request.Title))
                {
                    if (!await _elasticsearchService.IsAvailableAsync())
                    {
                        courseDTOs = courseDTOs
                            .Where(p => p.Title.ToLower().Contains(request.Title.ToLower()) || p.Description.ToLower().Contains(request.Title.ToLower()))
                            .ToList();
                    }
                    else
                    {
                        await _elasticsearchService.EnsureIndexExistsAsync("courses");
                        await _elasticsearchService.IndexCoursesAsync(courseDTOs);
                        courseDTOs = await _elasticsearchService.SearchCoursesByNameAsync(request.Title);
                    }
                }

                return courseDTOs;
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the courses: " + ex.Message);
            }
        }

        public async Task<DiscountInformationResponse> DiscountInformationResponse(int courseId)
        {
            try
            {
                var discountId = await GetMaxDiscountId(courseId);
                var discount = discountId != null ? await _discountService.GetDiscount((int)discountId) : null;
                return _mapper.Map<DiscountInformationResponse>(discount);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the discount information: " + ex.Message);
            }
        }

        public async Task<List<InstructorInformation>> InstructorInformation(int courseId)
        {
            try
            {
                var instructorDbset = await _courseInstructorRepository.GetDbSet();
                var instructors = await instructorDbset
                    .Where(ci => ci.CourseId == courseId)
                    .Select(ci => ci.Instructor)
                    .ToListAsync();

                return _mapper.Map<List<InstructorInformation>>(instructors);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the instructor information: " + ex.Message);
            }
        }

        public async Task<int> NumberOfEnrollments(int courseId)
        {
            try
            {
                var enrollmentDbset = await _enrollmentRepository.GetDbSet();
                return await enrollmentDbset
                    .Where(e => e.CourseId == courseId)
                    .CountAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the number of enrollments: " + ex.Message);
            }
        }

        public async Task<List<CourseCardResponse>> GetCourseInformation(GetCoursesRequest request)
        {
            try
            {
                var courseCard = new List<CourseCardResponse>();
                var courses = await GetCoursesByConditions(request);

                if (courses == null || courses.Count == 0)
                {
                    throw new Exception("No courses found.");
                }

                foreach (var course in courses)
                {
                    var courseCardResponse = new CourseCardResponse
                    {
                        Course = _mapper.Map<CoursesResponse>(course),
                        Review = await _reviewService.GetAverageRatingAndNumberOfRatings(course.CourseId),
                        Discount = await DiscountInformationResponse(course.CourseId),
                        Instructors = await InstructorInformation(course.CourseId),
                        Enrollment = new EnrollmentInformation
                        {
                            TotalEnrollments = await NumberOfEnrollments(course.CourseId)
                        }
                    };
                    courseCard.Add(courseCardResponse);
                }

                return courseCard;
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the course information: " + ex.Message);
            }
        }

        public async Task<PaginatedList<CourseCardResponse>> GetPagingCourseInformation(GetCoursesRequest request, Paging paging)
        {
            try
            {
                var courseCards = await GetCourseInformation(request);

                if (!paging.PageSize.HasValue || paging.PageSize <= 0)
                {
                    paging.PageSize = 10;
                }

                if (!paging.PageIndex.HasValue || paging.PageIndex <= 0)
                {
                    paging.PageIndex = 1;
                }

                var totalCount = courseCards.Count;
                var skip = (paging.PageIndex.Value - 1) * paging.PageSize.Value;
                var take = paging.PageSize.Value;

                var validSortOptions = new[] { "most_popular", "highest_rated", "newest" };
                if (string.IsNullOrEmpty(paging.Sort) || !validSortOptions.Contains(paging.Sort))
                {
                    paging.Sort = "most_popular";
                }

                courseCards = paging.Sort switch
                {
                    "most_popular" => courseCards.OrderByDescending(p => p.Enrollment.TotalEnrollments).ToList(),
                    "highest_rated" => courseCards.OrderByDescending(p => p.Review.AverageRating).ToList(),
                    "newest" => courseCards.OrderByDescending(p => p.Course.CreatedAt).ToList(),
                    _ => courseCards
                };

                var paginatedCourseCards = courseCards.Skip(skip).Take(take).ToList();

                return new PaginatedList<CourseCardResponse>(paginatedCourseCards, totalCount, paging.PageIndex.Value, paging.PageSize.Value);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the course information: " + ex.Message);
            }
        }

        //public async Task<CouponInformation> CouponInformation(int courseId, string userId)
        //{
        //    try
        //    {
        //        var couponDbset = await _couponRepository.GetDbSet();
        //        var coupons = 
        //        return new CouponInformation
        //        {
        //            Coupons = _mapper.Map<List<CouponResponse>>(coupons)
        //        };
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception("An error occurred while getting the coupon information: " + ex.Message);
        //    }
        //}
    }
}
