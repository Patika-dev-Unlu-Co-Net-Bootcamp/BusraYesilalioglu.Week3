using System.ComponentModel.DataAnnotations;

namespace CodeFirst_patika_dev.Entity
{
    public class Student {

        [Key]
        public int StudentId { get; set; }
        [Required]
        public string StudentName { get; set; }

        public string StudentSurname { get; set; }


    }
}
