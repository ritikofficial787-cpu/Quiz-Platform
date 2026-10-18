using System.Configuration;

namespace website.Data
{
    internal static class DatabaseHelper
    {
        internal static string ConnectionString
        {
            get
            {
                var cs = ConfigurationManager.ConnectionStrings["DefaultConnection"];
                if (cs == null || string.IsNullOrWhiteSpace(cs.ConnectionString))
                    throw new System.InvalidOperationException(
                        "DefaultConnection is missing from Web.config.");
                return cs.ConnectionString;
            }
        }
    }
}
