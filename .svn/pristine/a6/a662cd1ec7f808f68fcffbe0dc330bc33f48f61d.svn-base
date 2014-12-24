using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TweedeZit.Models.Domain
{
    // Swimming pool construction
    public class Zwembad
    {

        #region Properties

        public int ZwembadId { get; set; }

        [Display(Name = "Zwembadnaam")]
        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Naam { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Straat { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Straatnummer { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public int Postcode { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Gemeente { get; set; }
        #endregion
    }
}