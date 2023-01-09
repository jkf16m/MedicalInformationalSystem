using ClientAndBackend_MIS.Entities.PatientSection;
using ClientAndBackend_MIS.Entities.Shared;
using System.Collections.Generic;

namespace ClientAndBackend_MIS.Entities.DoctorSection
{
    public class Doctor
    {
        public int Id { get; set; }
        public PersonName Name { get; set; }
        public Address LivingAddress { get; set; }
        public Money Salary { get; set; }

        public int ProfessionalLicenseNumber { get; set; }
        public IEnumerable<Patient> Patients {get;set;}
    }
}
