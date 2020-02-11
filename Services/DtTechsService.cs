using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace SimpleAPI.Services
{
    public class DtTechsService : IDtTechsService
    {
        private readonly IDtTechsRepository _dtTechsRepository;

        public DtTechsService(IDtTechsRepository dtTechsRepository)
        {
            _dtTechsRepository = dtTechsRepository;
        }

        public async Task<IActionResult> GetDtTechAsync(string TechId)
        {
            try
            {
                DtTech tech = await _dtTechsRepository.GetDtTechAsync(TechId);

                if (tech != null)
                {
                    return new OkObjectResult(tech);
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

        public async Task<IActionResult> GetAllDtTechsAsync()
        {
            try
            {
                IEnumerable<DtTech> partner = await _dtTechsRepository.GetAllDtTechsAsync();

                if (partner != null)
                {
                    return new OkObjectResult(partner);
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
