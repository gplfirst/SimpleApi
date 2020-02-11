using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;

namespace SimpleAPI.Repositories
{
    public class DtTechsRepository : IDtTechsRepository
    {
        private readonly DP_MainContext _context;
        public DtTechsRepository(DP_MainContext context)
        {
            _context = context;
        }

        public async Task<DtTech> GetDtTechAsync(string TechId)
        {
            return await _context.Dt_Tech
                .AsNoTracking()
                .Where(p => p.Dt_Base_Object_Uid == TechId)
                .FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<DtTech>> GetAllDtTechsAsync()
        {
            return await _context.Dt_Tech
                .AsNoTracking()
                .ToListAsync();
        }
    }
}
