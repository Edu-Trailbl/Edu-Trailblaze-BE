﻿using AutoMapper;
using EduTrailblaze.Entities;
using EduTrailblaze.Repositories.Interfaces;
using EduTrailblaze.Services.DTOs;
using EduTrailblaze.Services.Helper;
using EduTrailblaze.Services.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Linq;

namespace EduTrailblaze.Services
{
    public class UserService : IUserService
    {
        private readonly UserManager<User> _userManager;
        private readonly IMapper _mapper;

        public UserService(UserManager<User> userManager, IMapper mapper)
        {
            _userManager = userManager;
            _mapper = mapper;
        }

        public async Task<User> GetUser(string userId)
        {
            try
            {
                return await _userManager.FindByIdAsync(userId);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the user.", ex);
            }
        }

        public async Task<IEnumerable<User>> GetUsers()
        {
            try
            {
                return await _userManager.Users.ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the users.", ex);
            }
        }

        public async Task<User> GetUserByEmail(string email)
        {
            try
            {
                return await _userManager.FindByEmailAsync(email);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the user.", ex);
            }
        }

        public async Task<List<UserDTO>?> GetUsersByConditions(GetUsersRequest request)
        {
            try
            {
                var dbSet = _userManager.Users.AsQueryable();

                if (request.TwoFactorEnabled != null)
                {
                    dbSet = dbSet.Where(c => c.TwoFactorEnabled == request.TwoFactorEnabled);
                }

                if (request.LockoutEnabled != null)
                {
                    dbSet = dbSet.Where(c => c.LockoutEnabled == request.LockoutEnabled);
                }

                if (request.UserName != null)
                {
                    dbSet = dbSet.Where(c => c.UserName.ToLower().Contains(request.UserName.ToLower()));
                }

                if (request.Email != null)
                {
                    dbSet = dbSet.Where(c => c.Email.ToLower().Contains(request.Email.ToLower()));
                }

                if (request.FullName != null)
                {
                    dbSet = dbSet.Where(c => c.UserProfile.Fullname != null && c.UserProfile.Fullname.ToLower().Contains(request.FullName.ToLower()));
                }

                if (request.Role != null)
                {
                    var role = request.Role.ToLower();
                    dbSet = dbSet.Where(c => _userManager.GetRolesAsync(c).Result.Any(r => r.ToLower().Contains(role)));
                }

                if (request.PhoneNumber != null)
                {
                    dbSet = dbSet.Where(c => c.PhoneNumber == request.PhoneNumber);
                }

                var items = await dbSet.ToListAsync();

                var userDTO = _mapper.Map<List<UserDTO>>(items);

                return userDTO;
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the users: " + ex.Message);
            }
        }


        public async Task<PaginatedList<UserDTO>> GetUserInformation(GetUsersRequest request, Paging paging)
        {
            try
            {
                var users = await GetUsersByConditions(request);

                if (users == null)
                {
                    return new PaginatedList<UserDTO>(new List<UserDTO>(), 0, 1, 10);
                }

                if (!paging.PageSize.HasValue || paging.PageSize <= 0)
                {
                    paging.PageSize = 10;
                }

                if (!paging.PageIndex.HasValue || paging.PageIndex <= 0)
                {
                    paging.PageIndex = 1;
                }

                var totalCount = users.Count;
                var skip = (paging.PageIndex.Value - 1) * paging.PageSize.Value;
                var take = paging.PageSize.Value;

                var validSortOptions = new[] { "id", "username", "order_value" };
                if (string.IsNullOrEmpty(paging.Sort) || !validSortOptions.Contains(paging.Sort))
                {
                    paging.Sort = "username";
                }

                users = paging.Sort switch
                {
                    "id" => users.OrderBy(p => p.Id).ToList(),
                    "username" => users.OrderBy(p => p.UserName).ToList(),
                    "email" => users.OrderBy(p => p.Email).ToList(),
                    _ => users
                };

                var paginatedCourseCards = users.Skip(skip).Take(take).ToList();

                return new PaginatedList<UserDTO>(paginatedCourseCards, totalCount, paging.PageIndex.Value, paging.PageSize.Value);
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while getting the courses: " + ex.Message);
            }
        }
    }
}
