using ClientAndBackend_MIS.Entities.DoctorSection;
using System.Collections.Generic;
using ClientAndBackend_MIS.Entities.PatientSection;
using ClientAndBackend_MIS.Entities.DrugSection;

namespace ClientAndBackend_MIS.Entities.ConsultationRoomSection
{
    public class ConsultationRoom
    {
        public int Id { get; set; } 
        public ICollection<Doctor> Doctors { get; set; }
        public ICollection<Patient> PatientsForRoutineChecks { get; set; }
        public ICollection<Drug> AvailableDrugs { get; set; }

    }
}
