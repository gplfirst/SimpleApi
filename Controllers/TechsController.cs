using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNet.OData;
using SimpleAPI.Interfaces;
using SimpleAPI.Models;
using SimpleAPI.Filters;

namespace SimpleAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AppAutentificationFilter]
    public class TechsController : ControllerBase
    {
        private readonly IDtTechsService _dtTechsService;
        private readonly DP_MainContext _context;

        public TechsController(IDtTechsService dtTechsService, DP_MainContext context)
        {
            _dtTechsService = dtTechsService;
            _context = context;
        }

        // GET /api/partners
        //http://localhost:49858/api/partners
        [HttpGet]
        [FormatFilter]
        [EnableQuery(PageSize = 10)]
        public async Task<IActionResult> GetAllTechsAsync()
        {
            return await _dtTechsService.GetAllDtTechsAsync();
        }

        // GET /api/partners/5
        [HttpGet("{id}")]
        [EnableQuery(PageSize = 10)]
        public async Task<IActionResult> GetTechAsync(string id)
        {
            return await _dtTechsService.GetDtTechAsync(id);
        }

    }
}