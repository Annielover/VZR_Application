using System;
using System.ComponentModel.DataAnnotations;

namespace TweedeZit
{
    // -----------------------------------------------------------------------------------
    // OPLEIDINGSDAG = SWIMMING DAY (where we educate (opleiden => opleidingsdag) swimmers)
    // -----------------------------------------------------------------------------------

    public class Opleidingsdag
    {
        // Properties
        #region Properties

        public int OpleidingsdagId { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Naam { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        [DataType(DataType.Date)]
        [Display(Name = "Datum")]
        public DateTime Date { get; set; }

        #endregion
    }
}