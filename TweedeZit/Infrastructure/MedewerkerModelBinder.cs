﻿using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TweedeZit.Models.DAL;
using TweedeZit.Models.Domain;

namespace TweedeZit.Infrastructure
{
    [ExcludeFromCodeCoverage]
    public class MedewerkerModelBinder : IModelBinder
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var repo = (IMedewerkerRepository) DependencyResolver.Current.GetService(typeof (IMedewerkerRepository));
            if (controllerContext.HttpContext.User.Identity.IsAuthenticated)
            {
                return repo.FindBy(controllerContext.HttpContext.User.Identity.Name);
            }
            Medewerker medewerker = repo.FindAll().ToArray().LastOrDefault();
            return medewerker;
        }
    }
}