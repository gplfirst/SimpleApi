using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SimpleAPI.Interfaces
{
    public interface IStmApiClientsService
    {
        Task<IActionResult> GetPartnerAsync(int ClientId);
        Task<IActionResult> GetAllPartnersAsync();
    }
}
