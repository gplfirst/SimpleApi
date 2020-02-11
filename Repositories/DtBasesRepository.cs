using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace SimpleAPI.Repositories
{
    public class DtBasesRepository : IDtBasesRepository
    {
        private readonly DP_MainContext _context;
        public DtBasesRepository(DP_MainContext context)
        {
            _context = context;
        }

        public async Task<DtBase> GetDtBasesAsync(string BaseId)
        {
            return await _context.Dt_Base
                .AsNoTracking().Where(w => w.Object_Uid == BaseId).FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<DtBase>> GetAllDtBasesAsync()
        {
            return await _context.Dt_Base
                .AsNoTracking().ToListAsync();
        }
    }
}
