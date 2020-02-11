using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace SimpleAPI.Repositories
{
    public class StmApiClientsRepository : IStmApiClientsRepository
    {
        private readonly DP_MainContext _context;
        public StmApiClientsRepository(DP_MainContext context)
        {
            _context = context;
        }
        public async Task<StmApiClients> GetClientsAsync(int ClientId)
        {
            return await _context.Stm_Api_Clients.AsNoTracking().Where(p => p.Client_Id == ClientId).FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<StmApiClients>> GetAllClientsAsync()
        {
            return await _context.Stm_Api_Clients.AsNoTracking().ToListAsync();
        }
        //public bool FindAPIKey(string API_KEY)
        //{
        //    StmApiClients cl = _context.Stm_Api_Clients.FirstOrDefault(f => f.Api_Key == API_KEY);
        //    if (cl == null) return false;
        //    return true;
        //}
    }
}
