using Microsoft.EntityFrameworkCore;

namespace ClientAndBackend_MIS.Entities.Shared
{
    [Owned]
    public class PersonName
    {
        public string Name { get; set; }
        public string MiddleName { get; set; }
        public string FatherLastName { get; set; }
        public string MotherLastName { get; set; }
    }
}
