using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;

namespace SimpleAPI.Interfaces
{
    public interface IPartnersRepository
    {
        Task<RefPartners> GetPartnersAsync(int PartnerId);
        Task<IEnumerable<RefPartners>> GetAllPartnersAsync();
    }
}
