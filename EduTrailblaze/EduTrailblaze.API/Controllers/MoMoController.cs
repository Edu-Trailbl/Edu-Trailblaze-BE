﻿using EduTrailblaze.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace EduTrailblaze.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MoMoController : ControllerBase
    {
        private readonly IMoMoService _momoService;

        public MoMoController(IMoMoService momoService)
        {
            _momoService = momoService;
        }

        [HttpGet("payment-url")]
        public async Task<IActionResult> GetPaymentUrl(decimal amount, int orderId, int paymentId)
        {
            try
            {
                string paymentUrl = await _momoService.CreatePaymentUrl(amount, orderId, paymentId);
                return Ok(paymentUrl);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("validate")]
        public async Task<IActionResult> ValidatePaymentResponse([FromQuery] string queryString)
        {
            try
            {
                var response = await _momoService.ValidatePaymentResponse(queryString);
                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
