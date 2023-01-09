using ClientAndBackend_MIS.Entities.SymptomSection;
using System.Collections.Generic;

namespace ClientAndBackend_MIS.Entities.IllnessSection
{
    public class Illness
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public IEnumerable<Symptom> Symptoms { get; set; }
    }
}
