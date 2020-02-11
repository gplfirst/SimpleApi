using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;

namespace SimpleAPI.Interfaces
{
    public interface IDtBasesRepository
    {
        Task<DtBase> GetDtBasesAsync(string BaseId);
        Task<IEnumerable<DtBase>> GetAllDtBasesAsync();
    }
}
