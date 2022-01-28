using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CodeFirst_patika_dev.Entity
{
    public class Success
    {
        [Key]
        public int SuccessId { get; set; }
        [Required]
        public float SuccessStatus { get; set; }
        
        public int AttendanceId { get; set; }
        public Attendance Attendances { get; set; }

    }
}
