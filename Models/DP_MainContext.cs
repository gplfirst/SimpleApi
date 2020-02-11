using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace SimpleAPI.Models
{
    public partial class DP_MainContext : DbContext
    {
        public DP_MainContext(){}
        public DP_MainContext(DbContextOptions<DP_MainContext> options) : base(options){}

        public virtual DbSet<DtBase> Dt_Base { get; set; }
        public virtual DbSet<DtTech> Dt_Tech { get; set; }
        public virtual DbSet<RefMediaType> Ref_MediaType { get; set; }
        public virtual DbSet<RefPartners> Ref_Partners { get; set; }
        public virtual DbSet<StmApiClients> Stm_Api_Clients { get; set; }
    }
}
