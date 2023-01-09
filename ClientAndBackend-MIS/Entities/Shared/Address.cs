using Microsoft.EntityFrameworkCore;

namespace ClientAndBackend_MIS.Entities.Shared
{
    [Owned]
    public class Address
    {
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string PhoneNumber { get; set; }

    }
}
