using System;
using System.Linq;

#pragma warning disable 1591
namespace Dye.WebAPI.Models
{
    public class DyeDTO
    {
      public string Colour { get; set; }

      public DyeDTO(string colour)
      {
        Colour = colour;
      }
    }
}
