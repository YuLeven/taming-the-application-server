using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Dye.WebAPI.Models;

#pragma warning disable 1591
namespace Dye.WebAPI.Controllers
{
    public class DyeController : ControllerBase
    {
        [HttpGet]
        [Route("dye/{colour}")]
        public async Task<ActionResult<DyeDTO>> MakeDye(string colour)
        {
            await Task.Delay(500);
            return new DyeDTO(colour);
        }
    }
}
