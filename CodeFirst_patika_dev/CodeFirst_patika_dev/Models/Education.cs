using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace CodeFirst_patika_dev.Entity
{
   
    public class Education
    {
        [Key]
        public int EducationId { get; set; }
        [Required]
        public string EducationName { get; set; }
        public int TeacherId { get; set; }
        public virtual Teacher Teachers { get; set; }
        public int AssistantId { get; set; }
        public virtual Assistant Assistants { get; set; }
        public int PartipantsId { get; set; }
        public virtual ICollection<Partipant> Partipants { get; set; }



    }
}
