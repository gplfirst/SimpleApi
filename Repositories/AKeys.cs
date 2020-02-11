using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SimpleAPI.Repositories
{
    public class AKeys
    {
        private static List<string> api_keys;
        public List<string> Api_keys { get => api_keys; set => api_keys = value; }

        public AKeys()
        {
        }
        public AKeys(List<string> ak)
        {
            if (Api_keys == null)
            {
                Api_keys = ak;
            }
        }
    }
}
