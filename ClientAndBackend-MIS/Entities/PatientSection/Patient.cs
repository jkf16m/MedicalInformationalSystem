using ClientAndBackend_MIS.Entities.IllnessSection;
using ClientAndBackend_MIS.Entities.Shared;
using System.Collections.Generic;

namespace ClientAndBackend_MIS.Entities.PatientSection
{
    public class Patient
    {
        public int Id { get; set; }
        public PersonName Name { get; set; }
        public Address LivingAddress { get; set; }
        public IEnumerable<Illness> Illnesses {get;set;}
    }
}
