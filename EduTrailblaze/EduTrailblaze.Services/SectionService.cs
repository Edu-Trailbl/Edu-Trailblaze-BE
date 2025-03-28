﻿using AutoMapper;
using EduTrailblaze.Entities;
using EduTrailblaze.Repositories.Interfaces;
using EduTrailblaze.Services.DTOs;
using EduTrailblaze.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace EduTrailblaze.Services
{
    public class SectionService : ISectionService
    {
        private readonly IRepository<Section, int> _sectionRepository;
        private readonly ICourseService _courseService;
        private readonly IMapper _mapper;

        public SectionService(IRepository<Section, int> sectionRepository, ICourseService courseService, IMapper mapper)
        {
            _sectionRepository = sectionRepository;
            _courseService = courseService;
            _mapper = mapper;
        }

        public async Task<Section?> GetSection(int sectionId)
        {
            try
            {
                return await _sectionRepository.GetByIdAsync(sectionId);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the section: " + ex.Message);
            }
        }

        public async Task<IEnumerable<Section>> GetSections()
        {
            try
            {
                return await _sectionRepository.GetAllAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the section: " + ex.Message);
            }
        }

        public async Task AddSection(Section section)
        {
            try
            {
                await _sectionRepository.AddAsync(section);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the section: " + ex.Message);
            }
        }

        public async Task UpdateSection(Section section)
        {
            try
            {
                await _sectionRepository.UpdateAsync(section);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the section: " + ex.Message);
            }
        }

        public async Task DeleteSection(Section section)
        {
            try
            {
                await _sectionRepository.DeleteAsync(section);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the section: " + ex.Message);
            }
        }

        public async Task AddSection(CreateSectionRequest section)
        {
            try
            {
                var newSection = new Section
                {
                    CourseId = section.CourseId,
                    Title = section.Title,
                    Description = section.Description
                };
                await _sectionRepository.AddAsync(newSection);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the section: " + ex.Message);
            }
        }

        public async Task UpdateSection(UpdateSectionRequest section)
        {
            try
            {
                var existingSection = await _sectionRepository.GetByIdAsync(section.SectionId);
                if (existingSection == null)
                {
                    throw new Exception("Section not found.");
                }
                existingSection.Title = section.Title;
                existingSection.Description = section.Description;
                await _sectionRepository.UpdateAsync(existingSection);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the section: " + ex.Message);
            }
        }

        public async Task DeleteSection(int sectionId)
        {
            try
            {
                var section = await _sectionRepository.GetByIdAsync(sectionId);
                if (section == null)
                {
                    throw new Exception("Section not found.");
                }
                await _sectionRepository.DeleteAsync(section);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while deleting the section: " + ex.Message);
            }
        }

        public async Task UpdateSectionDuration(int sectionId)
        {
            try
            {
                var sectionDbSet = await _sectionRepository.GetDbSet();

                var section = sectionDbSet
                    .Include(s => s.Lectures)
                    .FirstOrDefault(s => s.Id == sectionId);
                if (section == null)
                {
                    throw new Exception("Section not found.");
                }

                var lectures = section.Lectures;
                if (lectures == null || lectures.Count == 0)
                {
                    throw new Exception("No lectures found for the section.");
                }

                var duration = lectures.Where(l => !l.IsDeleted).Sum(l => l.Duration);

                section.Duration = TimeSpan.FromMinutes(duration);

                await _sectionRepository.UpdateAsync(section);
                await _courseService.UpdateCourseDuration(section.CourseId);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the section duration: " + ex.Message);
            }
        }

        public async Task UpdateNumberOfLectures(int sectionId)
        {
            try
            {
                var sectionDbSet = await _sectionRepository.GetDbSet();
                var section = sectionDbSet
                    .Include(s => s.Lectures)
                    .FirstOrDefault(s => s.Id == sectionId);
                if (section == null)
                {
                    throw new Exception("Section not found.");
                }
                section.NumberOfLectures = section.Lectures.Where(l => !l.IsDeleted).ToList().Count;
                await _sectionRepository.UpdateAsync(section);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating the number of lectures: " + ex.Message);
            }
        }

        public async Task<List<SectionDTO>?> GetSectionsByConditions(GetSectionsRequest request)
        {
            try
            {
                var dbSet = await _sectionRepository.GetDbSet();

                if (request.CourseId != null)
                {
                    dbSet = dbSet.Where(c => c.CourseId == request.CourseId);
                }

                if (!string.IsNullOrEmpty(request.Title))
                {
                    dbSet = dbSet.Where(c => c.Title.ToLower().Contains(request.Title.ToLower()));
                }

                if (!string.IsNullOrEmpty(request.Description))
                {
                    dbSet = dbSet.Where(c => c.Description.ToLower().Contains(request.Description.ToLower()));
                }

                if (request.MinNumberOfLectures != null)
                {
                    dbSet = dbSet.Where(c => c.NumberOfLectures >= request.MinNumberOfLectures);
                }

                if (request.MaxNumberOfLectures != null)
                {
                    dbSet = dbSet.Where(c => c.NumberOfLectures <= request.MaxNumberOfLectures);
                }

                if (request.MinDuration != null)
                {
                    dbSet = dbSet.Where(c => c.Duration >= TimeSpan.FromMinutes(request.MinDuration.Value));
                }

                if (request.MaxDuration != null)
                {
                    dbSet = dbSet.Where(c => c.Duration <= TimeSpan.FromMinutes(request.MaxDuration.Value));
                }

                var sections = await dbSet.ToListAsync();

                return _mapper.Map<List<SectionDTO>>(sections);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the sections: " + ex.Message);
            }
        }
    }
}
