﻿using Contracts.Domain;
using System.ComponentModel.DataAnnotations;

namespace EduTrailblaze.Entities
{
    public class Notification : EntityAuditBase<int>
    {

        [Required]
        public string Title { get; set; }

        [Required, StringLength(int.MaxValue)]
        public string Message { get; set; }

        [Required]
        public bool IsGlobal { get; set; } = false;

        [Required]
        public bool IsActive { get; set; } = true;


        // Navigation properties
        public virtual ICollection<UserNotification> UserNotifications { get; set; }
    }
}
