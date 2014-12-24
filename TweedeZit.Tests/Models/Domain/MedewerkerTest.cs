using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TweedeZit.Controllers;
using TweedeZit.Models.Domain;
using System.Web.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TweedeZit.Tests.Models.Domain
{
    [TestClass]
    public class MedewerkerTest
    {
        private Medewerker _medewerker1;
        private Leertraject _leertraject1;
        private Leertraject _leertraject2;

        [TestInitialize]
        public void Setup()
        {
            _leertraject1 = new Leertraject
            {
                LeertrajectId = 1,
                Titel = "Hoger Redder",
                Omschrijving = "Opleiding tot Hoger Redder"
            };
            _leertraject2 = new Leertraject
            {
                LeertrajectId = 2,
                Titel = "Duiker Redder",
                Omschrijving = "Opleiding tot Duiker Redder"
            };
            _medewerker1 = new Medewerker {Email = "marie.de.wilde@gmail.com", Naam = "De Wilde", Voornaam = "Marie"};

            DateTime start = DateTime.Now;

            _leertraject1.Add(new Opleidingsdag {OpleidingsdagId = 1, Naam = "dag 1", Date = start.AddDays(1)});
            _leertraject1.Add(new Cursist
            {
                CursistId = 1,
                Naam = "Bels",
                Voornaam = "Tine",
                Email = "tine.bels@hotmail.com"
            });

            _leertraject2.Add(new Opleidingsdag {OpleidingsdagId = 1, Naam = "dag 1", Date = start.AddDays(1)});
            _leertraject2.Add(new Cursist
            {
                CursistId = 1,
                Naam = "Bels",
                Voornaam = "Tine",
                Email = "tine.bels@hotmail.com"
            });


            _medewerker1.Leertrajecten.Add(_leertraject1);
            _medewerker1.Leertrajecten.Add(_leertraject2);
        }

        [TestMethod]
        public void GetAllLeertrajectenReturnsAlleLeertrajecten()
        {
            Assert.AreEqual(2, _medewerker1.GetAllLeertrajecten().Count());
        }

        [TestMethod]
        public void GetLeertrajectIdReturnsLeertraject()
        {
            const int leertrajectId = 1;
            Assert.AreEqual("Hoger Redder", _medewerker1.GetLeertraject(leertrajectId).Titel);
        }
    }
}