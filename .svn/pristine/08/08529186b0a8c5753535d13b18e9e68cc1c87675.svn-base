using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace TweedeZit
{
    // Time registration
    public class Tijdvak
    {
        // Properties
        #region Properties

        public int TijdvakId { get; set; }

        public string DagNaam { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public TimeSpan Van { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public TimeSpan Tot { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        [Display(Name = "Aantal zwemmers")]
        public int AantalZwemmers { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        [Display(Name = "Aantal banen")]
        public int AantalBanen { get; set; }
        #endregion
    }
}