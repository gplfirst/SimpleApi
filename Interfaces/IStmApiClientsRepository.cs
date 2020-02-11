using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SimpleAPI.Models;

namespace SimpleAPI.Interfaces
{
    public interface IStmApiClientsRepository
    {
        Task<StmApiClients> GetClientsAsync(int ClientId);
        Task<IEnumerable<StmApiClients>> GetAllClientsAsync();
//        bool FindAPIKey( string API_KEY);
    }
}
