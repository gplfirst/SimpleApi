using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SimpleAPI.Models
{
    public partial class StmApiClients
    {
        [Key]
        public int Client_Id { get; set; }
        public string ClientName { get; set; }
        public string Api_Key { get; set; }
        public DateTime EntryDate { get; set; }
        public DateTime? ExpirationDate { get; set; }
    }
}
