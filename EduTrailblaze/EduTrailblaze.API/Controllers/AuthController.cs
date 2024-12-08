﻿using EduTrailblaze.Entities;
using EduTrailblaze.Services.Helper;
using EduTrailblaze.Services.Interface;
using EduTrailblaze.Services.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace EduTrailblaze.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly TokenGenerator _jwtToken;
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly ILogger<AuthController> _logger;
        private readonly IAuthService _authService;

        public AuthController(TokenGenerator tokenGenerator, UserManager<User> userManager, SignInManager<User> signInManager, IAuthService authService)
        {
            _jwtToken = tokenGenerator;
            _userManager = userManager;
            _signInManager = signInManager;
            _authService = authService;

        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterModel model)
        {
            var result = await _authService.Register(model);

            if (result.StatusCode == 200)
            {
                return Ok(new { Message = result });

            }
            return StatusCode(result.StatusCode, result);

        }

        [HttpPost("login")]
        //[ValidateAntiForgeryToken]
        public async Task<IActionResult> Login([FromBody] LoginModel model)
        {
            var result = await _authService.Login(model);

            if (result.StatusCode == 200)
            {
                return Ok(new { Message = result });
            }
            return StatusCode(result.StatusCode, result);

        }

        [HttpPost("logout")]

        public async Task<IActionResult> Logout(string userId)
        {
            //  var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
            {
                return BadRequest(new { Message = "User not found" });
            }
            Response.Cookies.Delete("refreshToken");
            Response.Cookies.Delete("signature");
            var result = await _authService.Logout(userId);

            if (result.StatusCode == 200)
            {
                return Ok(new { Message = result });
            }
            return StatusCode(result.StatusCode, result);
        }

        [HttpGet("refreshToken")]
        public async Task<IActionResult> RefreshToken()
        {

            var user = await _userManager.GetUserAsync(User);
            var id = user.Id;
            var refreshToken = Request.Cookies["refreshToken"];
            if (refreshToken == null)
            {
                return BadRequest(new { Message = "Refresh token is required" });
            }

            var result = await _authService.RefreshToken(refreshToken);

            if (result.StatusCode == 200)
            {
                return Ok(new { Message = result });
            }
            return StatusCode(result.StatusCode, result);
        }

        [HttpPost("VerifyAuthenticatorCode")]
        public async Task<IActionResult> EnableAuthenticator([FromBody] TwoFactorAuthenticationModel model)
        {
            var result = await _authService.VerifyAuthenticatorCode(model.UserId, model.Code);

            if (result.StatusCode == 200)
            {
                return Ok(new { Message = result });
            }
            return StatusCode(result.StatusCode, result);
        }

        [HttpPost("forgot-Password")]
        public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordModel model)
        {

            var result = await _authService.ForgotPassword(model);

            if (result.StatusCode == 200)
            {
                return Ok(new { Message = result });
            }
            return StatusCode(result.StatusCode, result);

        }

        [HttpPost("reset-password")]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordModel model)
        {

            var result = await _authService.ResetPassword(model);

            if (result.StatusCode == 200)
            {
                return Ok(new { Message = result });
            }
            return StatusCode(result.StatusCode, result);
        }

        [HttpPost("admin/assign-role")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> AssignRole([FromBody] AssignRoleModel model)
        {
            var result = await _authService.AssignRole(model);

            if (result.StatusCode == 200)
            {
                return Ok(new { Message = result });
            }
            return StatusCode(result.StatusCode, result);
        }
    }
}
