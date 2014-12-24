using System;
using System.Web.Mvc;
using TweedeZit.Infrastructure;
using TweedeZit.Models.Domain;

namespace TweedeZit.Controllers
{
    // Controller to manage the swimming pools, to get the weather and to plot directions in Google Maps.
    [Authorize]
    public class ZwembadController : Controller
    {
        private IMedewerkerRepository _medewerkerRepository;
        private String _address1 = "";
        private String _address2 = "";

        public ZwembadController(IMedewerkerRepository medewerkerRepository)
        {
            _medewerkerRepository = medewerkerRepository;
        }

        // returns a list of swimming pools to the view
        public ActionResult Index([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker)
        {
            return View(medewerker);
        }

        // returns the weather in JSON format based on the given postal code from the view
        public void GetWeather(String postalCode)
        {
            if (String.IsNullOrEmpty(postalCode))
                throw new ArgumentException("De\"postalCode\" kan niet leeg zijn.", "postalCode");

            var json = WeatherServiceProvider.GetWeather(postalCode);

            Response.Write(json);
        }

        // This method extracts the addresses of the swimming pool that the user selected in order to plot the directions.
        // It calls the method "RenderMapDirections" to pass the addresses to the view.
        // It is called after the user submits the form (by clicking on a button).
        [HttpPost]
        public ActionResult Index([ModelBinder(typeof (MedewerkerModelBinder))] Medewerker medewerker, int[] vertrek,
            int[] aankomst)
        {
            var zwembad1 = medewerker.GetZwembad(vertrek[0]);
            var zwembad2 = medewerker.GetZwembad(aankomst[0]);

            _address1 = zwembad1.Straat + " " + zwembad1.Straatnummer + " " + zwembad1.Gemeente;
            _address2 = zwembad2.Straat + " " + zwembad2.Straatnummer + " " + zwembad2.Gemeente;


            return RedirectToAction("RenderMapDirections", new {address_1 = _address1, address_2 = _address2});
        }

        // Passes the addresses to the view (using ViewData). The view then displays them on Google Maps
        public ActionResult RenderMapDirections(String address_1, String address_2)
        {
            ViewData["_address1"] = address_1;
            ViewData["_address2"] = address_2;

            return View();
        }
    }
}