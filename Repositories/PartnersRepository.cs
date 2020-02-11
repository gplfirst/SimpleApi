using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;

namespace SimpleAPI.Repositories
{
    public class PartnersRepository : IPartnersRepository
    {
        private readonly DP_MainContext _context;
        public PartnersRepository( DP_MainContext context)
        {
            _context = context;
        }

        public async Task<RefPartners> GetPartnersAsync(int PartnerId)
        {
            return await _context.Ref_Partners.AsNoTracking().Where(p => p.Partner_Id == PartnerId).FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<RefPartners>> GetAllPartnersAsync()
        {
            return await _context.Ref_Partners.AsNoTracking().ToListAsync();
        }
    }
}
