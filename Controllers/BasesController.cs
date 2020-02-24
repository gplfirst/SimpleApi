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
    public class BasesController : ControllerBase
    {
        private readonly IDtBasesService _dtBasesService;
        public BasesController(IDtBasesService dtBasesService)
        {
            _dtBasesService = dtBasesService;
        }

        // GET /api/partners
        //http://localhost:49858/api/partners
        [HttpGet]
        [FormatFilter]
        [EnableQuery(PageSize = 10)]
        public async Task<IActionResult> GetAllDtBasesAsync()
        {
            return await _dtBasesService.GetAllDtBasesAsync();
        }

        // GET /api/partners/5
        [HttpGet("{id}")]
        [EnableQuery(PageSize = 10)]
        public async Task<IActionResult> GetDtBaseAsync(string id)
        {
            return await _dtBasesService.GetDtBaseAsync(id);
        }

    }
}