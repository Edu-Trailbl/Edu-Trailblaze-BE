﻿using EduTrailblaze.Entities;
using EduTrailblaze.Repositories.Interfaces;
using EduTrailblaze.Services.Interfaces;

namespace EduTrailblaze.Services
{
    public class UserNotificationService : IUserNotificationService
    {
        private readonly IRepository<UserNotification, int> _userNotificationRepository;

        public UserNotificationService(IRepository<UserNotification, int> userNotificationRepository)
        {
            _userNotificationRepository = userNotificationRepository;
        }

        public async Task<UserNotification?> GetUserNotification(int userNotificationId)
        {
            try
            {
                return await _userNotificationRepository.GetByIdAsync(userNotificationId);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the userNotification.", ex);
            }
        }

        public async Task<IEnumerable<UserNotification>> GetUserNotifications()
        {
            try
            {
                return await _userNotificationRepository.GetAllAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the userNotification.", ex);
            }
        }

        public async Task AddUserNotification(UserNotification userNotification)
        {
            try
            {
                await _userNotificationRepository.AddAsync(userNotification);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the userNotification.", ex);
            }
        }

        public async Task UpdateUserNotification(UserNotification userNotification)
        {
            try
            {
                await _userNotificationRepository.UpdateAsync(userNotification);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the userNotification.", ex);
            }
        }

        public async Task DeleteUserNotification(UserNotification userNotification)
        {
            try
            {
                await _userNotificationRepository.DeleteAsync(userNotification);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the userNotification.", ex);
            }
        }
    }
}
