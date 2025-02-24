﻿using Contracts.Domain;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace EduTrailblaze.Entities
{
    [Index(nameof(LanguageId), nameof(CourseId), IsUnique = true)]
    public class CourseLanguage : EntityBase<int>
    {

        [ForeignKey("Course")]
        public int CourseId { get; set; }

        [ForeignKey("Language")]
        public int LanguageId { get; set; }


        // Navigation properties
        public virtual Course Course { get; set; }
        public virtual Language Language { get; set; }
    }
}