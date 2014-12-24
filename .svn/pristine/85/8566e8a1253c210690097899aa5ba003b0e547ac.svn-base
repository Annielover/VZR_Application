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
    public class LeertrajectTest
    {
        private Leertraject _leertraject1;
        private Medewerker _medewerker1;
        private Cursist _cursist1;
        private Cursist _cursist2;
        private Cursist _cursist3;
        private Opleidingsdag _dag1;
        private Opleidingsdag _dag2;
        private Opleidingsdag _dag3;
        private Opleidingsdag _dag4;
        private Opleidingsdag _dag5;
        private DateTime _start;

        [TestInitialize]
        public void Setup()
        {
            _leertraject1 = new Leertraject
            {
                LeertrajectId = 1,
                Titel = "Hoger Redder",
                Omschrijving = "Opleiding tot Hoger Redder",
            };
            _medewerker1 = new Medewerker {Email = "marie.de.wilde@gmail.com", Naam = "De Wilde", Voornaam = "Marie"};

            _start = new DateTime(2013, 7, 10, 0, 0, 0);

            _dag1 = new Opleidingsdag {OpleidingsdagId = 1, Naam = "dag 1", Date = _start.AddDays(1)};
            _dag2 = new Opleidingsdag {OpleidingsdagId = 2, Naam = "dag 2", Date = _start.AddDays(2)};
            _dag3 = new Opleidingsdag {OpleidingsdagId = 3, Naam = "dag 3", Date = _start.AddDays(3)};
            _dag4 = new Opleidingsdag {OpleidingsdagId = 4, Naam = "dag 4", Date = _start.AddDays(4)};
            _dag5 = new Opleidingsdag {OpleidingsdagId = 5, Naam = "dag 5", Date = _start.AddDays(5)};

            _leertraject1.Add(_dag1);
            _leertraject1.Add(_dag2);
            _leertraject1.Add(_dag3);
            _leertraject1.Add(_dag4);
            _leertraject1.Add(_dag5);

            _cursist1 = new Cursist {CursistId = 1, Naam = "Bels", Voornaam = "Tine", Email = "tine.bels@hotmail.com"};
            _cursist2 = new Cursist
            {
                CursistId = 2,
                Naam = "Serneels",
                Voornaam = "Kim",
                Email = "kim_serneels@gmail.com"
            };
            _cursist3 = new Cursist
            {
                CursistId = 3,
                Naam = "Cruybergs",
                Voornaam = "Sander",
                Email = "sander_cruybergs@gmail.com"
            };

            _leertraject1.Add(_cursist1);
            _leertraject1.Add(_cursist2);
            _leertraject1.Add(_cursist3);

            _medewerker1.Leertrajecten.Add(_leertraject1);
        }

        [TestMethod]
        public void CursistsCanBeAdded()
        {
            var cursist4 = new Cursist
            {
                CursistId = 1,
                Email = "test@test.test",
                Naam = "De Wilde",
                Voornaam = "Laurent"
            };
            Assert.AreEqual(15, _leertraject1.Aanwezigheden.Count());
            _leertraject1.Add(cursist4);
            Assert.AreEqual(4, _leertraject1.Cursisten.Count());
            Assert.AreEqual(20, _leertraject1.Aanwezigheden.Count());
        }

        [TestMethod]
        public void CursistsCanBeRemoved()
        {
            _leertraject1.Remove(_cursist1);
            Assert.AreEqual(2, _leertraject1.Cursisten.Count());
            Assert.AreEqual(10, _leertraject1.Aanwezigheden.Count());
        }

        [TestMethod]
        public void OpleidingsdagCanBeAdded()
        {
            var dag = new Opleidingsdag {OpleidingsdagId = 67, Naam = "Test"};
            Assert.AreEqual(5, _leertraject1.Opleidingsdagen.Count());
            Assert.AreEqual(15, _leertraject1.Aanwezigheden.Count());
            _leertraject1.Add(dag);
            Assert.AreEqual(6, _leertraject1.Opleidingsdagen.Count());
            Assert.AreEqual(18, _leertraject1.Aanwezigheden.Count());
        }

        [TestMethod]
        public void OpleidingsdagCanBeRemoved()
        {
            _leertraject1.Remove(_dag1);
            Assert.AreEqual(4, _leertraject1.Opleidingsdagen.Count());
            Assert.AreEqual(12, _leertraject1.Aanwezigheden.Count());
        }


        [TestMethod]
        public void GetOpleidingsdagenReturnsOpleidingsdagenOrderedByDate()
        {
            Assert.AreEqual(5, _leertraject1.GetOpleidingsdagen().Count());
            DateTime date = _start.AddDays(1);
            int day = date.Date.Day;
            Assert.AreEqual(day, _leertraject1.GetOpleidingsdagen().FirstOrDefault().Date.Day);
        }

        [TestMethod]
        public void GetDagIdReturnsDag()
        {
            const int dagId = 1;
            Opleidingsdag dag = _leertraject1.GetDag(dagId);
            Assert.AreEqual("dag 1", dag.Naam);
        }

        [TestMethod]
        public void IsAanwezigReturnsAanwezigOrAfwezig()
        {
            Assert.IsFalse(_leertraject1.IsAanwezig(_cursist2, _dag3));
        }

        [TestMethod]
        public void SetAanwezigChangesAanwezigheid()
        {
            bool aanwezig = _leertraject1.IsAanwezig(_cursist1, _dag1);
            Assert.IsFalse(aanwezig);
            _leertraject1.SetAanwezig(_cursist1, _dag1);
            Assert.IsTrue(_leertraject1.IsAanwezig(_cursist1, _dag1));
        }

        [TestMethod]
        public void SetAfwezigChangesAanwezigheid()
        {
            _leertraject1.SetAanwezig(_cursist1, _dag1);
            Assert.IsTrue(_leertraject1.IsAanwezig(_cursist1, _dag1));
            _leertraject1.SetAfwezig(_cursist1, _dag1);
            Assert.IsFalse(_leertraject1.IsAanwezig(_cursist1, _dag1));
        }

        [TestMethod]
        public void GetAanwezigheidsLijstReturnsAanwezighedenForOpleidingsdag()
        {
            Assert.AreEqual(3, _leertraject1.GetAanwezigheidslijst(_dag3).Count());
        }
    }
}