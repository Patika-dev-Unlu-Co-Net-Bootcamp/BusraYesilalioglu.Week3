using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst_patika_dev.Entity
{
    public class Attendance
    {
        [Key]
        public int AttendanceId { get; set; }
        [ForeignKey("StudentId")]
        public int StudentId { get; set; }
        public virtual Student Students { get; set; }
        
        [Required]
        public float AttendanceWeek8 { get; set; }

    }
}
