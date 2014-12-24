using Ninject;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using TweedeZit.Infrastructure;
using TweedeZit.Models;
using TweedeZit.Models.DAL;
using WebMatrix.WebData;

namespace TweedeZit
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterAuth();

            Database.SetInitializer<AanwezigheidsContext>(new AanwezigheidsInitializer());
            new AanwezigheidsContext().Medewerkers.ToList();

            WebSecurity.InitializeDatabaseConnection("Aanwezigheid", "Medewerker", "MedewerkerId", "Naam",
                autoCreateTables: true);

            ModelBinders.Binders.Add(typeof (Medewerker), new MedewerkerModelBinder());
        }
    }
}