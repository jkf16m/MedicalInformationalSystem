using ClientAndBackend_MIS.Entities.PatientSection;
using ClientAndBackend_MIS.Entities.Shared;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ClientAndBackend_MIS.Entities.DoctorSection
{
    public class Doctor
    {
        public int Id { get; set; }
        [Required]
        public PersonName Name { get; set; }
        [Required]
        public Address LivingAddress { get; set; }
        [Required]
        public Money Salary { get; set; }

        public int ProfessionalLicenseNumber { get; set; }
        public IEnumerable<Patient> Patients {get;set;}
    }
}
