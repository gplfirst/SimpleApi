using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;

namespace SimpleAPI.Interfaces
{
    public interface IDtTechsRepository
    {
        Task<DtTech> GetDtTechAsync(string TechId);
        Task<IEnumerable<DtTech>> GetAllDtTechsAsync();
    }
}
