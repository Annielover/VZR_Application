﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TweedeZit.Models.Domain
{
    //Interface for MedewerkerRepository
    public interface IMedewerkerRepository
    {
        Medewerker FindBy(string email);
        IQueryable<Medewerker> FindAll();
        void Add(Medewerker medewerker);
        void SaveChanges();
    }
}