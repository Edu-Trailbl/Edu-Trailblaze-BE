﻿using EduTrailblaze.Entities;
using EduTrailblaze.Services.DTOs;

namespace EduTrailblaze.Services.Interfaces
{
    public interface IReviewService
    {
        Task<Review?> GetReview(int reviewId);

        Task<IEnumerable<Review>> GetReviews();

        Task AddReview(Review review);

        Task UpdateReview(Review review);

        Task DeleteReview(Review review);

        Task AddReview(CreateReviewRequest review);

        Task UpdateReview(UpdateReviewRequest review);

        Task DeleteReview(int review);

        Task<CourseReviewInformation> GetAverageRatingAndNumberOfRatings(int courseId);

        Task<IQueryable<Review>> GetDbSetReview();
    }
}
