using ClientAndBackend_MIS.Entities.IllnessSection;
using ClientAndBackend_MIS.Entities.Shared;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ClientAndBackend_MIS.Entities.PatientSection
{
    public class Patient
    {
        public int Id { get; set; }
        [Required]
        public PersonName Name { get; set; }
        [Required]
        public Address LivingAddress { get; set; }
        public IEnumerable<Illness> Illnesses {get;set;}
    }
}
