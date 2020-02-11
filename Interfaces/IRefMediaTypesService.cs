using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SimpleAPI.Interfaces
{
    public interface IRefMediaTypesService
    {
        Task<IActionResult> GetRefMediaTypesAsync(int MediaTypeId);
        Task<IActionResult> GetAllRefMediaTypesAsync();
    }
}
