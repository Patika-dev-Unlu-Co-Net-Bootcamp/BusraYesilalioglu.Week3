using System.ComponentModel.DataAnnotations;

namespace CodeFirst_patika_dev.Entity
{
    public class Attendance
    {
        [Key]
        public int AttendanceId { get; set; }
        [Required]
        public int StudentId { get; set; }
        public virtual Student Students { get; set; }
        public float AttendanceWeek8 { get; set; }
        [Required]
        public int SuccessId { get; set; }
        public virtual Success Successz { get; set; }

    }
}
