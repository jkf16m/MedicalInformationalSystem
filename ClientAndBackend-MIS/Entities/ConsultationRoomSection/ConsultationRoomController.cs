using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ClientAndBackend_MIS.Entities.ConsultationRoomSection
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsultationRoomController : ControllerBase
    {
        public ConsultationRoomController(MISContext MIScontext)
        {
            _mainDBcontext = MIScontext;
        }
        private MISContext _mainDBcontext;


        // GET: api/<ConsultationRoomController>
        [HttpGet]
        public async Task<IEnumerable<ConsultationRoom>> GetAsync()
        {
            return await _mainDBcontext.ConsultationRoom.ToListAsync();
        }

        // GET api/<ConsultationRoomController>/5
        [HttpGet("{id}")]
        public async Task<ConsultationRoom> Get(int id)
        {
            return await _mainDBcontext.ConsultationRoom.FindAsync(id);
        }

        // POST api/<ConsultationRoomController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ConsultationRoomController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ConsultationRoomController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
