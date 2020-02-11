using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace SimpleAPI.Repositories
{
    public class RefMediaTypesRepository : IRefMediaTypesRepository
    {
        private readonly DP_MainContext _context;
        public RefMediaTypesRepository(DP_MainContext context)
        {
            _context = context;
        }

        public async Task<RefMediaType> GetMediaTypesAsync(int MediaTypeId)
        {
            return await _context.Ref_MediaType.AsNoTracking().Where(p => p.MediaType_Id == MediaTypeId).FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<RefMediaType>> GetAllMediaTypesAsync()
        {
            return await _context.Ref_MediaType.AsNoTracking().ToListAsync();
        }
    }
}
