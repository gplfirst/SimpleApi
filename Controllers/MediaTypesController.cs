using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNet.OData;
using SimpleAPI.Interfaces;
using SimpleAPI.Filters;

namespace SimpleAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AppAutentificationFilter]
    public class MediaTypesController : ControllerBase
    {
        private readonly IRefMediaTypesService _refMediaTypesService;
        public MediaTypesController(IRefMediaTypesService refMediaTypesService)
        {
            _refMediaTypesService = refMediaTypesService;
        }

        // GET /api/partners
        //http://localhost:49858/api/partners
        [HttpGet]
        [FormatFilter]
        [EnableQuery(PageSize = 10)]
        public async Task<IActionResult> GetAllMediaTypesAsync()
        {
            return await _refMediaTypesService.GetAllRefMediaTypesAsync();
        }

        // GET /api/partners/5
        [HttpGet("{id}")]
        [EnableQuery(PageSize = 10)]
        public async Task<IActionResult> GetMediaTypeAsync(int id)
        {
            return await _refMediaTypesService.GetRefMediaTypesAsync(id);
        }

    }
}