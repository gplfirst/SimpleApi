using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SimpleAPI.Models;
using SimpleAPI.Interfaces;


namespace SimpleAPI.Services
{
    public class StmApiClientsService : IStmApiClientsService
    {
        private readonly IStmApiClientsRepository _clientsRepository;

        public StmApiClientsService(IStmApiClientsRepository clientsRepository)
        {
            _clientsRepository = clientsRepository;
        }

        public async Task<IActionResult> GetPartnerAsync(int ClientId)
        {
            try
            {
                StmApiClients client = await _clientsRepository.GetClientsAsync(ClientId);

                if (client != null)
                {
                    return new OkObjectResult(client);
                }
                else
                {
                    return new NotFoundResult();
                }
            }
            catch
            {
                return new ConflictResult();
            }
        }

        public async Task<IActionResult> GetAllPartnersAsync()
        {
            try
            {
                IEnumerable<StmApiClients> client = await _clientsRepository.GetAllClientsAsync();

                if (client != null)
                {
                    return new OkObjectResult(client);
                }
                else
                {
                    return new NotFoundResult();
                }
            }
            catch (Exception ex)
            {
                return new ConflictResult();
            }
        }
    }
}
