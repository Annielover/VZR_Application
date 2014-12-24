using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;
using TweedeZit.Infrastructure;
using TweedeZit.Models.Domain;

namespace TweedeZit.Controllers
{
    // controller to manage the absences / presences
    [Authorize]
    public class AanwezigheidController : Controller
    {
        private readonly IMedewerkerRepository _medewerkerRepository;

        public AanwezigheidController(IMedewerkerRepository medewerkerRepository)
        {
            _medewerkerRepository = medewerkerRepository;
        }

        #region Aanwezigheden

        // returns the list of presences of specific swimming day to the html view.
        public ActionResult Aanwezigheden(Medewerker medewerker, int leertrajectId, int dagId)
        {
            var dag = medewerker.GetLeertraject(leertrajectId).GetDag(dagId);
            ViewBag.Message = dag.Date.Date.DayOfWeek + " " + dag.Date.Date.Day + "/" + dag.Date.Date.Month + "/" +
                              dag.Date.Date.Year;
            ViewBag.MessageTraject = medewerker.GetLeertraject(leertrajectId).Titel.ToLower();
            ViewData["leertraject"] = leertrajectId;
            return View(medewerker.GetLeertraject(leertrajectId).GetAanwezigheidslijst(dag));
        }


        // this method is called after changing the presences (i.e. after submitting the form).
        // it registers / stores the new values (presences) in the database
        [HttpPost]
        public ActionResult Aanwezigheden(Medewerker medewerker, int leertrajectId, int dagId, FormCollection formValues)
        {
            var dag = medewerker.GetLeertraject(leertrajectId).GetDag(dagId);
            var aanwezigheden = medewerker.GetLeertraject(leertrajectId)
                .GetAanwezigheidslijst(dag);

            ViewBag.Message = dag.Date.Date.DayOfWeek + " " + dag.Date.Date.Day + "/" + dag.Date.Date.Month + "/" +
                              dag.Date.Date.Year;
            ViewBag.MessageTraject = medewerker.GetLeertraject(leertrajectId).Titel.ToLower();

            try
            {
                if (ModelState.IsValid)
                {
                    if (!string.IsNullOrEmpty(formValues["item.Aanwezig"]))
                    {
                        var temp = formValues["item.Aanwezig"].Split(',');
                        var i = 0;
                        foreach (var a in aanwezigheden)
                        {
                            if (temp[i].ToLower() == "true" && temp[i + 1].ToLower() == "false")
                            {
                                medewerker.GetLeertraject(leertrajectId).SetAanwezig(a.Cursist, a.Dag);
                                i += 2;
                            }
                            else
                            {
                                medewerker.GetLeertraject(leertrajectId).SetAfwezig(a.Cursist, a.Dag);
                                i++;
                            }
                        }
                    }
                    _medewerkerRepository.SaveChanges();

                    TempData["Msg"] = "Wijzigingen succesvol opgeslagen!";

                    return RedirectToAction("Opleidingsdagen", new {id = leertrajectId});
                }
                return View(medewerker.GetLeertraject(leertrajectId).GetAanwezigheidslijst(dag));
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", e.Message);

                return View(medewerker.GetLeertraject(leertrajectId).GetAanwezigheidslijst(dag));
            }
        }

        #endregion

        #region Leertrajecten (Swimming groups)

        // returns a list of all swimming groups to the html view
        public ActionResult Index([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker)
        {
            var numberOfTrajecten = medewerker.GetAllLeertrajecten().Count();

            if (numberOfTrajecten == 0)
            {
                return View("NoLeertrajecten");
            }

            var cursisten = medewerker.GetAllCursisten();
            ICollection<string> mededelingen = new List<string>();
            ICollection<string> warnings = new List<string>();

            foreach (var cursist in cursisten)
            {
                if (DateTime.Now > cursist.Abonnement.Date.AddMonths(-1) && !(DateTime.Now > cursist.Abonnement.Date))
                {
                    warnings.Add("Het abonnement van " + cursist.Voornaam + " " + cursist.Naam + " verloopt binnenkort.");
                }
                else if (DateTime.Now > cursist.Abonnement.Date)
                {
                    mededelingen.Add("Het abonnement van " + cursist.Voornaam + " " + cursist.Naam + " is vervallen!");
                }
            }

            if (warnings.Count() == 0)
            {
                warnings.Add("Geen items");
            }

            if (mededelingen.Count() == 0)
            {
                mededelingen.Add("Geen items");
            }

            ViewData["mededelingen"] = mededelingen;
            ViewData["warnings"] = warnings;
            return View(medewerker.GetAllLeertrajecten());
        }

        // returns a list of filtered results of swimming groups. it is used in the search. We update only a part of the view. I.e., the div with the results
        public PartialViewResult SearchZwemgroep([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            string value)
        {
            var resultaten = medewerker.GetLeertrajectFromName(value);
            return PartialView(resultaten);
        }

        // creates a new swimming group
        public ActionResult Create()
        {
            return View(new Leertraject());
        }

        // the post of the create. It is called after a user submits the form. It stores the newly created swimming group in the database
        [HttpPost]
        public ActionResult Create([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            Leertraject leertraject)
        {
            if (ModelState.IsValid)
            {
                medewerker.Leertrajecten.Add(leertraject);
                _medewerkerRepository.SaveChanges();
                TempData["Msg"] = "Trainingsgroep succesvol aangemaakt!";
                return RedirectToAction("Index");
            }
            return View(leertraject);
        }

        // Edit values of a specified swimming group
        public ActionResult Edit([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker, int id)
        {
            ViewBag.Message = medewerker.GetLeertraject(id).Titel.ToLower();
            return View("Edit", medewerker.GetLeertraject(id));
        }

        // Called after the user submits the form with the modifications to the swimming group. the new values are stored in the database
        [HttpPost]
        public ActionResult Edit([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker, int id,
            FormCollection formValues)
        {
            ViewBag.Message = medewerker.GetLeertraject(id).Titel.ToLower();
            var leertraject = medewerker.GetLeertraject(id);
            if (leertraject == null)
            {
                return RedirectToAction("Index");
            }

            if (TryUpdateModel(leertraject, formValues.ToValueProvider()))
            {
                _medewerkerRepository.SaveChanges();
                TempData["Msg"] = "Trainingsgroep succesvol gewijzigd!";
                return RedirectToAction("Index");
            }
            return View("EditLeertraject", leertraject);
        }

        #endregion

        #region Cursisten (swimmers)

        // returns a list of all swimmers to the html view
        public ActionResult IndexZwemmers([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker, int id)
        {
            ViewBag.Message = medewerker.GetLeertraject(id).Titel.ToLower();
            return View(medewerker.GetLeertraject(id));
        }

        // creates a swimmer. (New member of the swimming club)
        public ActionResult CreateCursist([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int leertrajectId)
        {
            ViewBag.Message = medewerker.GetLeertraject(leertrajectId).Titel.ToLower();
            ViewData["leertraject"] = leertrajectId;
            return View(new Cursist());
        }

        // the post of the "create swimmer". The method is called after a user submits the form. The new swimmer is stored in the database.
        [HttpPost]
        public ActionResult CreateCursist([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int leertrajectId, Cursist cursist)
        {
            if (ModelState.IsValid)
            {
                medewerker.GetLeertraject(leertrajectId).Add(cursist);
                _medewerkerRepository.SaveChanges();
                TempData["Msg"] = "Zwemmer succesvol aangemaakt!";
                return RedirectToAction("IndexZwemmers", new {id = leertrajectId});
            }
            ViewBag.Message = medewerker.GetLeertraject(leertrajectId).Titel.ToLower();
            return View(cursist);
        }

        // modifcations of existings swimmers
        public ActionResult EditCursist([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int cursistId)
        {
            var cursist = medewerker.GetCursist(cursistId);
            ViewBag.Message = cursist.Voornaam + " " + cursist.Naam;
            return View("EditCursist", cursist);
        }

        // post of "modifcations of existings swimmers". The method is called after a user submits the form. The modified values are then stored in the database.
        [HttpPost]
        public ActionResult EditCursist([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int cursistId, FormCollection formValues)
        {
            var cursist = medewerker.GetCursist(cursistId);
            if (cursist == null)
            {
                return RedirectToAction("IndexAllCursisten");
            }
            if (TryUpdateModel(cursist, formValues.ToValueProvider()))
            {
                _medewerkerRepository.SaveChanges();
                TempData["Msg"] = "Gegevens van zwemmer succesvol gewijzigd!";
                return RedirectToAction("IndexAllCursisten");
            }
            return View("EditCursist", cursist);
        }

        // removes a swmimmer
        public ActionResult DeleteCursist([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int cursistId)
        {
            var cursist = medewerker.GetCursist(cursistId);
            return View(cursist);
        }

        // post of "removes a swmimmer". the swimmer is removed from the system.
        [HttpPost, ActionName("DeleteCursist")]
        public ActionResult DeleteCursistConfirmed([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int cursistId)
        {
            var cursist = medewerker.GetCursist(cursistId);
            if (cursist == null)
            {
                return RedirectToAction("IndexAllCursisten");
            }
            try
            {
                var leertrajectId = medewerker.GetLeertrajectIdFromCursist(cursistId);
                medewerker.GetLeertraject(leertrajectId).Remove(cursist);
                _medewerkerRepository.SaveChanges();
                TempData["Msg"] = "Zwemmer succesvol verwijderd!";
                return RedirectToAction("IndexAllCursisten");
            }
            catch (Exception ex)
            {
                TempData["Msg"] = "ERROR: " + ex.Message;
                return RedirectToAction("IndexAllCursisten");
            }
        }

        #endregion

        #region Aanwezigheden van één cursist

        // lists the presences of all days of just one swimmer
        public ActionResult ListAanwezigheden([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int leertrajectId, int cursistId)
        {
            var cursist = medewerker.GetLeertraject(leertrajectId).GetCursist(cursistId);
            ViewBag.MessageNaam = cursist.Naam;
            ViewBag.MessageVoornaam = cursist.Voornaam;
            ViewData["leertraject"] = leertrajectId;
            return View(medewerker.GetLeertraject(leertrajectId).GetAanwezigheidslijst(cursist));
        }

        // This method is called after a user clicks on a button to send an e-mail. 
        // It sends all absences of the swimmer of all days to all the trainers.
        [HttpPost]
        public ActionResult ListAanwezigheden([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int leertrajectId, int cursistId, Aanwezigheid aanwezigheid)
        {
            try
            {
                var zwemmer = medewerker.GetCursist(cursistId);
                var aanwezigheidslijst = medewerker.GetLeertraject(leertrajectId).GetAanwezigheidslijst(zwemmer);
                Leertraject trainersgroep = medewerker.GetLeertrajectObjectFromName("Trainers");
                IEnumerable<Cursist> trainers = trainersgroep.GetCursisten();

                var mail = new MailMessage();

                var smtpServer = new SmtpClient("smtp.gmail.com");
                smtpServer.Credentials = new NetworkCredential("aanwezighedenvzr@gmail.com", "abcde12345AZ");
                smtpServer.EnableSsl = true;
                smtpServer.Port = 587;

                mail.From = new MailAddress("VZRafwezigheden@vzr.be");
                mail.To.Add(medewerker.Email);

                foreach (var t in trainers)
                {
                    mail.To.Add(t.Email);
                }
                
                mail.Subject = "Aanwezigheden van " + zwemmer.Voornaam + " " + zwemmer.Naam;

                foreach (var a in aanwezigheidslijst)
                {
                    var nederlands = a.Aanwezig.ToString();
                    if (nederlands == "False")
                    {
                        nederlands = "Afwezig";
                    }
                    else
                    {
                        nederlands = "Aanwezig";
                    }

                    mail.Body += " " + a.Dag.Naam + " " + a.Dag.Date.Day + "/" + a.Dag.Date.Month + "/" +
                                 a.Dag.Date.Year + ": " + nederlands + ".\n";
                }

                smtpServer.Send(mail);

                TempData["Msg"] = "De E-mail is succesvol verstuurd.";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                TempData["Msg"] = "ERROR: " + ex.Message;
                return RedirectToAction("Index");
            }
        }

        #endregion

        #region Opleidingsdagen

        // returns a "opleidingsdag" (= training day) of a swimming group to the html view
        public ActionResult Opleidingsdagen(Medewerker medewerker, int id)
        {
            ViewBag.Message = medewerker.GetLeertraject(id).Titel.ToLower();
            var numberofDays = medewerker.GetLeertraject(id).GetOpleidingsdagen().Count();

            if (numberofDays == 0)
            {
                return View("NoOpleidingsdagen", medewerker.GetLeertraject(id));
            }
            return View(medewerker.GetLeertraject(id));
        }

        // creates a "opleidingsdag" (= training day) for a swimming group
        public ActionResult CreateOpleidingsdag([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int leertrajectId)
        {
            ViewBag.Message = medewerker.GetLeertraject(leertrajectId).Titel.ToLower();
            ViewData["leertraject"] = leertrajectId;
            return View(new Opleidingsdag());
        }

        // the post of "creates a "opleidingsdag"". It saves a newly created day to the database.
        [HttpPost]
        public ActionResult CreateOpleidingsdag([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int leertrajectId, Opleidingsdag opleidingsdag)
        {
            medewerker.GetLeertraject(leertrajectId).Add(opleidingsdag);
            _medewerkerRepository.SaveChanges();
            TempData["Msg"] = "Trainingsdag succesvol aangemaakt!";
            return RedirectToAction("Opleidingsdagen", new {id = leertrajectId});
        }

        // modifies an existing training day
        public ActionResult EditOpleidingsdag([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int leertrajectId, int dagId)
        {
            var dag = medewerker.GetLeertraject(leertrajectId).GetDag(dagId);
            ViewData["leertraject"] = leertrajectId;
            ViewBag.Message = dag.Naam.ToLower();
            return View("EditOpleidingsdag", dag);
        }

        // stores the modifications made to a training day in the database. Called after a user submits the form
        [HttpPost]
        public ActionResult EditOpleidingsdag([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int leertrajectId, int dagId, FormCollection formValues)
        {
            var dag = medewerker.GetLeertraject(leertrajectId).GetDag(dagId);
            ViewBag.Message = dag.Naam.ToLower();

            if (TryUpdateModel(dag, formValues.ToValueProvider()))
            {
                _medewerkerRepository.SaveChanges();
                TempData["Msg"] = "Trainingsdag succesvol gewijzigd!";
                return RedirectToAction("Opleidingsdagen", new {id = leertrajectId});
            }
            return View("EditOpleidingsdag", dag);
        }

        #endregion

        #region Alle zwemmers en hun gegevens en hun zwemgroep wijzigen

        // returns a partial view with the search results containing a list of swimmers
        public PartialViewResult SearchPeople([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            string value)
        {
            var data = medewerker.GetCursistenByName(value);
            return PartialView(data);
        }

        // returns a list of all swimmers
        public ActionResult IndexAllCursisten([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker)
        {
            return View(medewerker);
        }

        // the post of the list of all swimmers. On the view, a user can change a swimmer of group. When he submits the changes, this method is called.
        [HttpPost]
        public ActionResult IndexAllCursisten([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            FormCollection formValues)
        {
            string[] leertrajecten;
            string[] cursisten;
            var aantal = 0;

            try
            {
                if (ModelState.IsValid)
                {
                    leertrajecten = formValues["Leertraject"].Split(',');

                    cursisten = formValues["item.CursistId"].Split(',');

                    for (var teller = 0; teller < leertrajecten.Length; teller++)
                    {
                        if (leertrajecten[teller] != "")
                        {
                            aantal++;
                            int cursistId = Convert.ToInt16(cursisten[teller]);
                            int leertrajectId = Convert.ToInt16(leertrajecten[teller]);

                            var cursist = medewerker.GetCursist(cursistId);
                            var previousLeertrajectId = medewerker.GetLeertrajectIdFromCursist(cursistId);
                            medewerker.GetLeertraject(previousLeertrajectId).Remove(cursist);
                            medewerker.GetLeertraject(leertrajectId).Add(cursist);
                        }
                    }

                    _medewerkerRepository.SaveChanges();

                    if (aantal > 1)
                    {
                        TempData["Msg"] = "Zwemmers succesvol van groep veranderd!";
                    }
                    else
                    {
                        TempData["Msg"] = "Zwemmer succesvol van groep veranderd!";
                    }

                    return RedirectToAction("IndexAllCursisten");
                }
                return View(medewerker);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(medewerker);
            }
        }

        #endregion
    }
}