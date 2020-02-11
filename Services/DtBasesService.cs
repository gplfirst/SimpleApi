using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace SimpleAPI.Services
{
    public class DtBasesService : IDtBasesService
    {
        private readonly IDtBasesRepository _dtBasesRepository;

        public DtBasesService(IDtBasesRepository dtBasesRepository)
        {
            _dtBasesRepository = dtBasesRepository;
        }

        public async Task<IActionResult> GetDtBaseAsync(string BaseId)
        {
            try
            {
                DtBase dtBase = await _dtBasesRepository.GetDtBasesAsync(BaseId);

                if (dtBase != null)
                {
                    return new OkObjectResult(dtBase);
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

        public async Task<IActionResult> GetAllDtBasesAsync()
        {
            try
            {
                IEnumerable<DtBase> dtBase = await _dtBasesRepository.GetAllDtBasesAsync();

                if (dtBase != null)
                {
                    return new OkObjectResult(dtBase);
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
