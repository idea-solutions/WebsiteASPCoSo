﻿using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(webcoso.Startup))]
namespace webcoso
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
