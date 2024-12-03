﻿using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EduTrailblaze.Entities
{
    [Index(nameof(OrderId), nameof(CourseId), IsUnique = true)]
    public class OrderDetail
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int OrderDetailId { get; set; }

        [ForeignKey("Order")]
        public int OrderId { get; set; }

        [ForeignKey("Course")]
        public int CourseId { get; set; }

        [Required]
        public decimal Price { get; set; }


        // Navigation properties
        public virtual Order Order { get; set; }
        public virtual Course Course { get; set; }
    }
}