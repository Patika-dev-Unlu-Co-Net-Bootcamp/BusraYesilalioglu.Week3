using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CodeFirst_patika_dev.Entity
{
    public class Partipant
    {
        [Key]
        public int PartipantId { get; set; }
        [Required]
        public string PartipanttName { get; set; }

        public string APartipantSurname { get; set; }
    }
}
