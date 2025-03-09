﻿using EduTrailblaze.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EduTrailblaze.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserCertificateController : ControllerBase
    {
        private readonly IUserCertificateService _userCertificateService;

        public UserCertificateController(IUserCertificateService userCertificateService)
        {
            _userCertificateService = userCertificateService;
        }

        [HttpGet]
        public async Task<IActionResult> GetUserCertificates()
        {
            try
            {
                var userCertificates = await _userCertificateService.GetUserCertificates();
                return Ok(userCertificates);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet("{userCertificateId}")]
        public async Task<IActionResult> GetUserCertificate(int userCertificateId)
        {
            try
            {
                var userCertificate = await _userCertificateService.GetUserCertificate(userCertificateId);
                if (userCertificate == null)
                {
                    return NotFound();
                }
                return Ok(userCertificate);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }


    }
}
