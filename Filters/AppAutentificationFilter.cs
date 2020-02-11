using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SimpleAPI.Models;
using System.Linq;
using SimpleAPI.Repositories;

namespace SimpleAPI.Filters
{
    public class AppAutentificatinFilter : Attribute, IActionFilter
    {
        public void OnActionExecuting(ActionExecutingContext context)
        {
            AKeys ak = new AKeys();
            string api_key = (string)context.HttpContext.Request.Query["API_KEY"];

            if (ak.Api_keys.IndexOf(api_key) == -1)
            {
                context.Result = new ContentResult()
                {
                    Content = "Ошибка 403 Forbidden"
                };
            }
        }
        public void OnActionExecuted(ActionExecutedContext context)
        {
            // код метода
        }

    }
}