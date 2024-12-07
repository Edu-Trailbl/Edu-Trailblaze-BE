﻿using SendGrid;
using SendGrid.Helpers.Mail;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EduTrailblaze.Services.Helper
{
    public class SendMail : ISendMail
    {
        private readonly ISendGridClient _sendGridClient;

        public SendMail(ISendGridClient sendGridClient)
        {
            _sendGridClient = sendGridClient;
        }

        public async Task<bool> SendForgotEmailAsync(string to_email, string subject, string resetPasswordUrl)
        {
            string filePath = Path.Combine(Directory.GetCurrentDirectory(), "Templates", "ForgetPassword.html");
            string mailText;
            using (var str = new StreamReader(filePath))
            {
                mailText = await str.ReadToEndAsync();
            }
            mailText = mailText.Replace("{resetPasswordUrl}", resetPasswordUrl);
            var from_email = new EmailAddress("halinh150@gmail.com");
            // var plainTextContent = "and easy to do anywhere, even with C#";
            // var htmlContent = "<strong>and easy to do anywhere, even with C#</strong>";
            var msg = MailHelper.CreateSingleEmail(from_email, new EmailAddress(to_email), subject, "", mailText);
            var response = await _sendGridClient.SendEmailAsync(msg).ConfigureAwait(false);
            if (response.IsSuccessStatusCode) return true;
            return false;
        }
    }
}
