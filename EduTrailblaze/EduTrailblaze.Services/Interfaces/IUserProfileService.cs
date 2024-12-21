﻿using EduTrailblaze.Entities;
using EduTrailblaze.Services.DTOs;

namespace EduTrailblaze.Services.Interfaces
{
    public interface IUserProfileService
    {
        Task<UserProfile?> GetUserProfile(string userProfileId);

        Task<IEnumerable<UserProfile>> GetUserProfiles();

        Task AddUserProfile(UserProfile userProfile);

        Task UpdateUserProfile(UserProfile userProfile);

        Task UpdateUserProfile(UpdateUserProfileRequest userProfile);

        Task DeleteUserProfile(UserProfile userProfile);
    }
}
