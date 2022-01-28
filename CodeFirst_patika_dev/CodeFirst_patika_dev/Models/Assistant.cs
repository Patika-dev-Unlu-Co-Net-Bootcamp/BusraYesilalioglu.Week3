using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace CodeFirst_patika_dev.Entity
{
    public class Assistant 
    {
        [Key]
        public int AssistantId { get; set; }
        [Required]
        public string AssistantName { get; set; }

        public string AssistantSurname { get; set; }

    }
}
