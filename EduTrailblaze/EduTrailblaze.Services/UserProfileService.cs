﻿using EduTrailblaze.Repositories.Interfaces;
using EduTrailblaze.Entities;
using EduTrailblaze.Services.Interfaces;

namespace EduTrailblaze.Services
{
    public class UserProfileService : IUserProfileService
    {
        private readonly IRepository<UserProfile> _userProfileRepository;

        public UserProfileService(IRepository<UserProfile> userProfileRepository)
        {
            _userProfileRepository = userProfileRepository;
        }

        public async Task<UserProfile?> GetUserProfile(int userProfileId)
        {
            try
            {
                return await _userProfileRepository.GetByIdAsync(userProfileId);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the userProfile.", ex);
            }
        }
        
        public async Task<IEnumerable<UserProfile>> GetUserProfiles()
        {
            try
            {
                return await _userProfileRepository.GetAllAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the userProfile.", ex);
            }
        }

        public async Task AddUserProfile(UserProfile userProfile)
        {
            try
            {
                await _userProfileRepository.AddAsync(userProfile);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the userProfile.", ex);
            }
        }

        public async Task UpdateUserProfile(UserProfile userProfile)
        {
            try
            {
                await _userProfileRepository.UpdateAsync(userProfile);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the userProfile.", ex);
            }
        }

        public async Task DeleteUserProfile(UserProfile userProfile)
        {
            try
            {
                await _userProfileRepository.DeleteAsync(userProfile);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the userProfile.", ex);
            }
        }
    }
}
