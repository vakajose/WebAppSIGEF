using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebAppSIGEF.Startup))]
namespace WebAppSIGEF
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
