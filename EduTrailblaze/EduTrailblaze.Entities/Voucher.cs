﻿using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EduTrailblaze.Entities
{
    [Index(nameof(OrderId), IsUnique = true)]
    public class Voucher
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int VoucherId { get; set; }

        [Required, StringLength(50)]
        public string DiscountType { get; set; } //'Percentage', 'Value'

        [Required]
        public decimal DiscountValue { get; set; }

        [Required]
        public bool IsUsed { get; set; } = false;

        public DateTime? StartDate { get; set; }

        public DateTime? ExpiryDate { get; set; }

        public decimal? MinimumOrderValue { get; set; }

        [ForeignKey("Order")]
        public int? OrderId { get; set; }


        // Navigation properties
        public virtual Order Order { get; set; }
    }
}