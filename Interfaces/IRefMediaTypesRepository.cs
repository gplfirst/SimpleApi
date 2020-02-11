using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;

namespace SimpleAPI.Interfaces
{
    public interface IRefMediaTypesRepository
    {
        Task<RefMediaType> GetMediaTypesAsync(int PartnerId);
        Task<IEnumerable<RefMediaType>> GetAllMediaTypesAsync();
    }
}
