using ClientAndBackend_MIS.Entities.Shared;
using System.Collections;
using System.ComponentModel.DataAnnotations;

namespace ClientAndBackend_MIS.Entities.DrugSection
{
    public class Drug
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }

        [Required]
        public Money AverageCost { get; set; }
    }
}
