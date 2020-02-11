using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SimpleAPI.Interfaces
{
    public interface IDtBasesService
    {
        Task<IActionResult> GetDtBaseAsync(string BaseId);
        Task<IActionResult> GetAllDtBasesAsync();
    }
}
