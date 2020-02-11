using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;

namespace SimpleAPI.Services
{
    public class PartnersService : IPartnersService
    {
        private readonly IPartnersRepository _partnersRepository;

        public PartnersService(IPartnersRepository partnersRepository)
        {
            _partnersRepository = partnersRepository;
        }

        public async Task<IActionResult> GetPartnerAsync(int partnerId)
        {
            try
            {
                RefPartners partner = await _partnersRepository.GetPartnersAsync(partnerId);

                if (partner != null)
                {
                    return new OkObjectResult( partner);
                }
                else
                {
                    return new NotFoundResult();
                }
            }
            catch
            {
                return new ConflictResult();
            }
        }

        public async Task<IActionResult> GetAllPartnersAsync()
        {
            try
            {
                IEnumerable<RefPartners> partner = await _partnersRepository.GetAllPartnersAsync();

                if (partner != null)
                {
                    return new OkObjectResult( partner);
                }
                else
                {
                    return new NotFoundResult();
                }
            }
            catch (Exception ex)
            {
                return new ConflictResult();
            }
        }

    }
}
