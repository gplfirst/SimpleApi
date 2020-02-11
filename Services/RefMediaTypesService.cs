using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace SimpleAPI.Services
{
    public class RefMediaTypesService : IRefMediaTypesService
    {
        private readonly IRefMediaTypesRepository _refMediaTypesRepository;

        public RefMediaTypesService(IRefMediaTypesRepository refMediaTypesRepository)
        {
            _refMediaTypesRepository = refMediaTypesRepository;
        }

        public async Task<IActionResult> GetRefMediaTypesAsync(int MedidTypeId)
        {
            try
            {
                RefMediaType refMedia = await _refMediaTypesRepository.GetMediaTypesAsync( MedidTypeId);

                if (refMedia != null)
                {
                    return new OkObjectResult(refMedia);
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

        public async Task<IActionResult> GetAllRefMediaTypesAsync()
        {
            try
            {
                IEnumerable<RefMediaType> refMediaTypes = await _refMediaTypesRepository.GetAllMediaTypesAsync();

                if (refMediaTypes != null)
                {
                    return new OkObjectResult( refMediaTypes);
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
