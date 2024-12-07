﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EduTrailblaze.Entities
{
    public class Course
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CourseId { get; set; }

        [Required, StringLength(255)]
        public string Title { get; set; }

        [Required, StringLength(int.MaxValue)]
        public string ImageURL { get; set; }

        [Required, StringLength(int.MaxValue)]
        public string Description { get; set; }

        [Required]
        public decimal Price { get; set; }

        public int Duration { get; set; } = 0;

        [Required]
        [StringLength(50)]
        public string DifficultyLevel { get; set; } // Beginner, Intermediate, Advanced

        [Required, StringLength(int.MaxValue)]
        public string Prerequisites { get; set; }

        [Required]
        public decimal EstimatedCompletionTime { get; set; }

        public DateTime CreatedAt { get; set; }

        public DateTime UpdatedAt { get; set; }

        [Required]
        public string CreatedBy { get; set; }

        [Required]
        public string UpdatedBy { get; set; }

        [Required]
        public bool IsPublished { get; set; }

        public bool IsDeleted { get; set; } = false;


        // Navigation properties
        public virtual ICollection<CourseInstructor> CourseInstructors { get; set; }
        public virtual ICollection<CourseDiscount> CourseDiscounts { get; set; }
        public virtual ICollection<CourseLanguage> CourseLanguages { get; set; }
        public virtual ICollection<CourseCoupon> CourseCoupons { get; set; }
        public virtual ICollection<CourseTag> CourseTags { get; set; }
        public virtual ICollection<Enrollment> Enrollments { get; set; }
        public virtual ICollection<Section> Sections { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
        public virtual ICollection<Certificate> Certificates { get; set; }
        public virtual ICollection<CartItem> CartItems { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<UserProgress> UserProgresses { get; set; }
    }
}
