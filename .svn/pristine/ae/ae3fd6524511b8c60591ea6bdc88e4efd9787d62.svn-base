using System.Web.Mvc;
using TweedeZit.Infrastructure;
using TweedeZit.Models.Domain;

namespace TweedeZit.Controllers
{
    // This controller manages the count of the absences of a swimmer on a particular day.

    // For administration purposes, the number of swimmers on a particular day AND hour are keeping track of.
    // "A particular day" = TellingDag
    // "AND hour" = TijdVak
    [Authorize]
    public class TellingController : Controller
    {
        private readonly IMedewerkerRepository _medewerkerRepository;

        // initialize the repository (=~ access to the database)
        public TellingController(IMedewerkerRepository medewerkerRepository)
        {
            _medewerkerRepository = medewerkerRepository;
        }

        // returns a list of all tellingdagen to the view
        public ActionResult Index([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker)
        {
            return View(medewerker);
        }

        // the initial view to edit an existing day
        public ActionResult EditDag([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int tellingDagId)
        {
            ViewBag.Message = "Wijzig dag " + medewerker.GetTellingDag(tellingDagId).Naam;
            return View("EditDag", medewerker.GetTellingDag(tellingDagId));
        }

        // the post of the inital view, that writes the changes made to the database
        [HttpPost]
        public ActionResult EditDag([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int tellingDagId, FormCollection formValues)
        {
            var tellingDag = medewerker.GetTellingDag(tellingDagId);
            if (tellingDag == null)
            {
                return RedirectToAction("Index", "Telling");
            }

            if (TryUpdateModel(tellingDag, formValues.ToValueProvider()))
            {
                _medewerkerRepository.SaveChanges();
                TempData["Msg"] = "Dag succesvol gewijzigd!";
                return RedirectToAction("Index", "Telling");
            }
            return RedirectToAction("Index", "Telling");
        }

        // edits an existing tijdvak (time slot)
        public ActionResult EditTijdvak([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int tellingDagId, int tijdvakId)
        {
            ViewBag.Message = "Wijzig tijdvak " + medewerker.GetTellingDag(tellingDagId).GetTijdvak(tijdvakId).Van +
                              "u - " + medewerker.GetTellingDag(tellingDagId).GetTijdvak(tijdvakId).Tot +
                              "u van trainingsdag " + medewerker.GetTellingDag(tellingDagId).Naam + " " +
                              medewerker.GetTellingDag(tellingDagId).Datum.Day + "/" +
                              medewerker.GetTellingDag(tellingDagId).Datum.Month + "/" +
                              medewerker.GetTellingDag(tellingDagId).Datum.Year;
            return View("EditTijdvak", medewerker.GetTellingDag(tellingDagId).GetTijdvak(tijdvakId));
        }

        // the post of previous method. It stores the modified values in the database. it is called after a user submits the form
        [HttpPost]
        public ActionResult EditTijdvak([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int tellingDagId, int tijdvakId, FormCollection formValues)
        {
            var tijdvak = medewerker.GetTellingDag(tellingDagId).GetTijdvak(tijdvakId);
            if (tijdvak == null)
            {
                return RedirectToAction("Index", "Telling");
            }

            if (TryUpdateModel(tijdvak, formValues.ToValueProvider()))
            {
                _medewerkerRepository.SaveChanges();
                TempData["Msg"] = "Tijdvak succesvol gewijzigd!";
                return RedirectToAction("Index", "Telling");
            }
            return RedirectToAction("Index", "Telling");
        }

        // creates a new day
        public ActionResult CreateTellingDag([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker)
        {
            return View(new TellingDag());
        }

        // the post of the create. the new values are stored in the database. Called when a user submits the form
        [HttpPost]
        public ActionResult CreateTellingDag([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            TellingDag tellingDag)
        {
            if (ModelState.IsValid)
            {
                medewerker.TellingDagen.Add(tellingDag);
                _medewerkerRepository.SaveChanges();
                TempData["Msg"] = "Dag succesvol aangemaakt, maak nu een tijdspanne aan.";
                return RedirectToAction("CreateTijdvak", "Telling", tellingDag);
            }
            return View(tellingDag);
        }

        // creates a new time slot
        public ActionResult CreateTijdvak([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            TellingDag tellingdag)
        {
            ViewBag.Message = tellingdag.Naam + " " + tellingdag.Datum.Date.Day + "/" + tellingdag.Datum.Date.Month +
                              "/" + tellingdag.Datum.Date.Year;
            return View(new Tijdvak());
        }

        // the post of the create. the new values are stored in the database. Called when a user submits the form
        [HttpPost]
        public ActionResult CreateTijdvak([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            TellingDag tellingdag, Tijdvak tijdvak)
        {
            medewerker.GetTellingDag(tellingdag.TellingDagId).Tijdvakken.Add(tijdvak);
            _medewerkerRepository.SaveChanges();
            TempData["Msg"] = "Tijdspanne succesvol aangemaakt!";
            return RedirectToAction("Index", "Telling");
        }

        // creates a new time slot
        public ActionResult CreateTijdvakId([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int tellingDagId)
        {
            var tellingdag = medewerker.GetTellingDag(tellingDagId);
            ViewBag.Message = tellingdag.Naam + " " + tellingdag.Datum.Date.Day + "/" + tellingdag.Datum.Date.Month +
                              "/" + tellingdag.Datum.Date.Year;
            return View(new Tijdvak());
        }

        // the post of the create. the new values are stored in the database. Called when a user submits the form
        [HttpPost]
        public ActionResult CreateTijdvakId([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker,
            int tellingDagId, Tijdvak tijdvak)
        {
            medewerker.GetTellingDag(tellingDagId).Tijdvakken.Add(tijdvak);
            _medewerkerRepository.SaveChanges();
            TempData["Msg"] = "Tijdspanne succesvol aangemaakt!";
            return RedirectToAction("Index", "Telling");
        }
    }
}