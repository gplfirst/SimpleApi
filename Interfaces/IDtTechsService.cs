using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace SimpleAPI.Interfaces
{
    public interface IDtTechsService
    {
        Task<IActionResult> GetDtTechAsync(string TechId);
        Task<IActionResult> GetAllDtTechsAsync();
    }
}
