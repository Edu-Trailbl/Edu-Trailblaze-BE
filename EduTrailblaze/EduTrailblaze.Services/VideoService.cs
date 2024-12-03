﻿using EduTrailblaze.Repositories.Interfaces;
using EduTrailblaze.Entities;
using EduTrailblaze.Services.Interfaces;

namespace EduTrailblaze.Services
{
    public class VideoService : IVideoService
    {
        private readonly IRepository<Video> _videoRepository;

        public VideoService(IRepository<Video> videoRepository)
        {
            _videoRepository = videoRepository;
        }

        public async Task<Video?> GetVideo(int videoId)
        {
            try
            {
                return await _videoRepository.GetByIdAsync(videoId);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the video.", ex);
            }
        }
        
        public async Task<IEnumerable<Video>> GetVideos()
        {
            try
            {
                return await _videoRepository.GetAllAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the video.", ex);
            }
        }

        public async Task AddVideo(Video video)
        {
            try
            {
                await _videoRepository.AddAsync(video);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the video.", ex);
            }
        }

        public async Task UpdateVideo(Video video)
        {
            try
            {
                await _videoRepository.UpdateAsync(video);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the video.", ex);
            }
        }

        public async Task DeleteVideo(Video video)
        {
            try
            {
                await _videoRepository.DeleteAsync(video);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the video.", ex);
            }
        }
    }
}
