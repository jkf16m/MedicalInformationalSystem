using Microsoft.EntityFrameworkCore;
using ClientAndBackend_MIS.Entities.ConsultationRoomSection;
using ClientAndBackend_MIS.Entities.DoctorSection;
using ClientAndBackend_MIS.Entities.PatientSection;

namespace ClientAndBackend_MIS.Entities
{
    public class MISContext : DbContext
    {
        public MISContext(DbContextOptions<MISContext> options): base(options)
        {
        }

        public DbSet<ConsultationRoom> ConsultationRoom { get; set; }
        public DbSet<Doctor> Doctor { get; set; }
        public DbSet<Patient> Patient { get; set; }
    }
}
