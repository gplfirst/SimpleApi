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
    public class ClientsController : ControllerBase
    {
        private readonly IStmApiClientsService _clientsService;
        public ClientsController(IStmApiClientsService clientsService)
        {
            _clientsService = clientsService;
        }

        // GET /api/partners
        //http://localhost:49858/api/partners
        [HttpGet]
        [FormatFilter]
        [EnableQuery(PageSize = 10)]
        public async Task<IActionResult> GetAllProductsAsync()
        {
            return await _clientsService.GetAllPartnersAsync();
        }

        // GET /api/partners/5
        [HttpGet("{id}")]
        [EnableQuery(PageSize = 10)]
        public async Task<IActionResult> GetProductAsync(int id)
        {
            return await _clientsService.GetPartnerAsync(id);
        }

    }
}