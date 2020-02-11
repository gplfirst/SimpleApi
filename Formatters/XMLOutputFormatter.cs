using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Text;
using Microsoft.Net.Http.Headers;
using System.Reflection;
using Microsoft.Extensions.Logging;
using SimpleAPI.Models;
using System.Xml;
using System.Collections;

namespace SimpleAPI.Formatters
{
    #region classdef
    public class XMLOutputFormatter : TextOutputFormatter
    #endregion
    {
        private Type FrmType;
        #region ctor
        public XMLOutputFormatter()
        {
            SupportedMediaTypes.Add(MediaTypeHeaderValue.Parse("application/xml"));

            SupportedEncodings.Add(Encoding.UTF8);
            SupportedEncodings.Add(Encoding.Unicode);
        }
        #endregion

        #region canwritetype
        protected override bool CanWriteType(Type type)
        {
            if (typeof(IEnumerable).IsAssignableFrom(type))
            {
                FrmType = typeof(RefPartners);
                return base.CanWriteType(type);
            }
            return false;
        }
        #endregion

        #region writeresponse
        public override async Task WriteResponseBodyAsync(OutputFormatterWriteContext context, Encoding selectedEncoding)
        {
            IServiceProvider serviceProvider = context.HttpContext.RequestServices;
            var logger = serviceProvider.GetService(typeof(ILogger<XMLOutputFormatter>)) as ILogger;

            var response = context.HttpContext.Response;
            StringBuilder buffer = new StringBuilder();

            foreach (var item in (IEnumerable)context.Object)
            {
                var xml = ObjectToXML(item, null, null).OuterXml;
                buffer.Append(xml.ToString() + Environment.NewLine);
            }

            await response.WriteAsync(buffer.ToString());
        }
        #endregion

        private static XmlDocument ObjectToXML(object obj, XmlDocument xmlDocument, XmlNode rootNode)
        {

            if (xmlDocument == null)
            {
                xmlDocument = new XmlDocument();
            }

            if (obj == null) return xmlDocument;

            Type type = obj.GetType();

            if (rootNode == null)
            {
                rootNode = xmlDocument.CreateElement(string.Empty, type.Name, string.Empty);
                xmlDocument.AppendChild(rootNode);
            }

            if (type.IsPrimitive || type == typeof(Decimal) || type == typeof(String) || type == typeof(DateTime))
            {

                // Simples types
                if (obj != null)
                    rootNode.InnerText = obj.ToString();

            }
            else if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(List<>))
            {
                // Genericis types

                XmlNode node = null;

                foreach (var item in (IEnumerable)obj)
                {
                    if (node == null)
                    {
                        node = xmlDocument.CreateElement(string.Empty, item.GetType().Name, string.Empty);
                        node = rootNode.AppendChild(node);
                    }
                    ObjectToXML(item, xmlDocument, node);
                }
            }
            else
            {
                // Classes types
                foreach (var propertie in obj.GetType().GetProperties())
                {

                    XmlNode node = xmlDocument.CreateElement(string.Empty, propertie.Name, string.Empty);
                    node = rootNode.AppendChild(node);
                    var valor = propertie.GetValue(obj, null);

                    ObjectToXML(valor, xmlDocument, node);
                }
            }
            return xmlDocument;
        }
    }
}
