﻿using AutoMapper;
using EduTrailblaze.Entities;
using EduTrailblaze.Repositories.Interfaces;
using EduTrailblaze.Services.DTOs;
using EduTrailblaze.Services.Helper;
using EduTrailblaze.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace EduTrailblaze.Services
{
    public class ReviewService : IReviewService
    {
        private readonly IRepository<Review, int> _reviewRepository;
        private readonly IRepository<UserProfile, string> _userProfileRepository;
        private readonly IRepository<Course, int> _courseRepository;
        private readonly INotificationService _notificationService;
        private readonly IMapper _mapper;

        public ReviewService(IRepository<Review, int> reviewRepository, IMapper mapper, IRepository<UserProfile, string> userProfileRepository, IRepository<Course, int> courseRepository, INotificationService notificationService)
        {
            _reviewRepository = reviewRepository;
            _mapper = mapper;
            _userProfileRepository = userProfileRepository;
            _courseRepository = courseRepository;
            _notificationService = notificationService;
        }

        public async Task<IQueryable<Review>> GetDbSetReview()
        {
            try
            {
                return await _reviewRepository.GetDbSet();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the review: " + ex.Message);
            }
        }

        public async Task<Review?> GetReview(int reviewId)
        {
            try
            {
                return await _reviewRepository.GetByIdAsync(reviewId);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the review: " + ex.Message);
            }
        }

        public async Task<IEnumerable<Review>> GetReviews()
        {
            try
            {
                return await _reviewRepository.GetAllAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the review: " + ex.Message);
            }
        }

        public async Task AddReview(Review review)
        {
            try
            {
                await _reviewRepository.AddAsync(review);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the review: " + ex.Message);
            }
        }

        public async Task UpdateReview(Review review)
        {
            try
            {
                await _reviewRepository.UpdateAsync(review);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the review: " + ex.Message);
            }
        }

        public async Task DeleteReview(Review review)
        {
            try
            {
                await _reviewRepository.DeleteAsync(review);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the review: " + ex.Message);
            }
        }

        public async Task AddReview(CreateReviewRequest review)
        {
            try
            {
                var student = await _userProfileRepository.GetByIdAsync(review.UserId) ?? throw new Exception("Student not found.");

                var course = await _courseRepository.GetByIdAsync(review.CourseId) ?? throw new Exception("Course not found.");

                var newReview = new Review
                {
                    CourseId = review.CourseId,
                    UserId = review.UserId,
                    Rating = review.Rating,
                    ReviewText = review.ReviewText
                };
                await _reviewRepository.AddAsync(newReview);

                await _notificationService.NotifyRecentActitity("New Review", $"{student.Fullname ?? student.Id} left a {review.Rating}-star review on {course.Title}", course.CreatedBy);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the review: " + ex.Message);
            }
        }

        public async Task UpdateReview(UpdateReviewRequest review)
        {
            try
            {
                var existingReview = await _reviewRepository.GetByIdAsync(review.ReviewId);
                if (existingReview == null)
                {
                    throw new Exception("Review not found.");
                }
                existingReview.Rating = review.Rating;
                existingReview.ReviewText = review.ReviewText;
                existingReview.UpdatedAt = DateTimeHelper.GetVietnamTime();
                await _reviewRepository.UpdateAsync(existingReview);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the review: " + ex.Message);
            }
        }

        public async Task DeleteReview(int reviewId)
        {
            try
            {
                var review = await _reviewRepository.GetByIdAsync(reviewId);
                if (review == null)
                {
                    throw new Exception("Review not found.");
                }
                review.IsDeleted = true;

                await _reviewRepository.UpdateAsync(review);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the review: " + ex.Message);
            }
        }

        public async Task<ReviewInformation> GetAverageRatingAndNumberOfRatings(int courseId)
        {
            try
            {
                var reviews = await _reviewRepository.GetAllAsync();
                var courseReviews = reviews.Where(r => r.CourseId == courseId);

                if (courseReviews.Count() == 0)
                {
                    return new ReviewInformation
                    {
                        AverageRating = 0,
                        TotalRatings = 0
                    };
                }

                var averageRating = courseReviews.Average(r => r.Rating);
                var numberOfRatings = courseReviews.Count();
                return new ReviewInformation
                {
                    AverageRating = averageRating,
                    TotalRatings = numberOfRatings
                };
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the average rating: " + ex.Message);
            }
        }

        public async Task<List<ReviewDTO>?> GetVReviewsByConditions(GetReviewsRequest request)
        {
            try
            {
                var dbSet = await _reviewRepository.GetDbSet();

                if (request.IsDeleted != null)
                {
                    dbSet = dbSet.Where(c => c.IsDeleted == request.IsDeleted);
                }

                if (request.UserId != null)
                {
                    dbSet = dbSet.Where(c => c.UserId == request.UserId);
                }

                if (request.CourseId != null)
                {
                    dbSet = dbSet.Where(c => c.CourseId == request.CourseId);
                }

                if (request.ReviewText != null)
                {
                    dbSet = dbSet.Where(c => c.ReviewText.ToLower().Contains(request.ReviewText.ToLower()));
                }

                if (request.MinRating != null)
                {
                    dbSet = dbSet.Where(c => c.Rating >= request.MinRating);
                }

                if (request.MaxRating != null)
                {
                    dbSet = dbSet.Where(c => c.Rating <= request.MaxRating);
                }

                var items = await dbSet.ToListAsync();

                var reviewDTO = _mapper.Map<List<ReviewDTO>>(items);

                return reviewDTO;
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the courses: " + ex.Message);
            }
        }

        public async Task<PaginatedList<ReviewDTO>> GetReviewInformation(GetReviewsRequest request, Paging paging)
        {
            try
            {
                var reviews = await GetVReviewsByConditions(request);

                if (reviews == null)
                {
                    return new PaginatedList<ReviewDTO>(new List<ReviewDTO>(), 0, 1, 10);
                }

                if (!paging.PageSize.HasValue || paging.PageSize <= 0)
                {
                    paging.PageSize = 10;
                }

                if (!paging.PageIndex.HasValue || paging.PageIndex <= 0)
                {
                    paging.PageIndex = 1;
                }

                var totalCount = reviews.Count;
                var skip = (paging.PageIndex.Value - 1) * paging.PageSize.Value;
                var take = paging.PageSize.Value;

                var validSortOptions = new[] { "top_review", "newest_review" };
                if (string.IsNullOrEmpty(paging.Sort) || !validSortOptions.Contains(paging.Sort))
                {
                    paging.Sort = "top_review";
                }

                reviews = paging.Sort switch
                {
                    "top_review" => reviews.OrderByDescending(p => p.Rating).ToList(),
                    "newest_review" => reviews.OrderByDescending(p => p.CreatedAt).ToList(),
                    _ => reviews
                };

                var paginatedReviews = reviews.Skip(skip).Take(take).ToList();

                return new PaginatedList<ReviewDTO>(paginatedReviews, totalCount, paging.PageIndex.Value, paging.PageSize.Value);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the courses: " + ex.Message);
            }
        }

        public async Task<List<RatingDetails>> GetRatingDetails(int courseId)
        {
            try
            {
                var reviews = await _reviewRepository.GetDbSet();
                var courseReviews = reviews.Where(r => r.CourseId == courseId && !r.IsDeleted);

                if (courseReviews.Count() == 0)
                {
                    return new List<RatingDetails>();
                }

                var ratingDetails = courseReviews.GroupBy(r => r.Rating)
                    .Select(r => new RatingDetails
                    {
                        Rating = r.Key,
                        RatingPercentage = (r.Count() * 100) / courseReviews.Count(),
                        TotalRatings = r.Count()
                    }).ToList();
                return ratingDetails;
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the average rating: " + ex.Message);
            }
        }
    }
}
