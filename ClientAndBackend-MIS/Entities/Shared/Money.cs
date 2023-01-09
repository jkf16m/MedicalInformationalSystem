using Microsoft.EntityFrameworkCore;

namespace ClientAndBackend_MIS.Entities.Shared
{
    [Owned]
    public class Money
    {
        public int Pesos { get; set; }
        public int Centavos { get; set; }

    }
}
