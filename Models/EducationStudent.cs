using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst_patika_dev.Entity
{
    public class EducationStudent
    {
        [Key]
        public int EducationStudentId { get; set; }
        [Required]
        public int StudentId { get; set; }
        public virtual Student Students { get; set; }
        [Required]
        public int EducationId { get; set; }
        public virtual Education Educations { get; set; }
        

    }
}
