using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNet.OData.Extensions;
using Microsoft.AspNet.OData.Formatter;
using Microsoft.Net.Http.Headers;
using Microsoft.AspNetCore.Mvc.Formatters;
using Newtonsoft.Json;
using Microsoft.Extensions.Logging;

using SimpleAPI.Models;
using SimpleAPI.Interfaces;
using SimpleAPI.Repositories;
using SimpleAPI.Services;
using SimpleAPI.Formatters;

namespace SimpleAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<DP_MainContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DefaultDatabase")));

            services.AddMvc(options =>
            {
                options.RespectBrowserAcceptHeader = true; // false by default
                options.OutputFormatters.Insert(0, new XMLOutputFormatter());
            })
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_2)
                .AddXmlDataContractSerializerFormatters();

            services.AddOData();
            services.AddODataQueryFilter();

            services.AddScoped<IPartnersRepository, PartnersRepository>();
            services.AddScoped<IPartnersService, PartnersService>();
            services.AddScoped<IStmApiClientsRepository, StmApiClientsRepository>();
            services.AddScoped<IStmApiClientsService, StmApiClientsService>();
            services.AddScoped<IRefMediaTypesRepository, RefMediaTypesRepository>();
            services.AddScoped<IRefMediaTypesService, RefMediaTypesService>();
            services.AddScoped<IDtBasesRepository, DtBasesRepository>();
            services.AddScoped<IDtBasesService, DtBasesService>();
            services.AddScoped<IDtTechsRepository, DtTechsRepository>();
            services.AddScoped<IDtTechsService, DtTechsService>();

            var optionsBuilder = new DbContextOptionsBuilder<DP_MainContext>();
            optionsBuilder.UseSqlServer(Configuration.GetConnectionString("DefaultDatabase"));
            var db = new DP_MainContext(optionsBuilder.Options);
            List<string> keys = db.Stm_Api_Clients.Select(s => s.Api_Key).ToList();
            AKeys ak = new AKeys(keys);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseMvc(routeBuilder =>
            {
                routeBuilder.EnableDependencyInjection();
                routeBuilder.Expand().Select().Filter().Count().OrderBy().MaxTop(null);
            });
            app.UseMvc();
        }
    }
}
