using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using TweedeZit.Infrastructure;
using TweedeZit.Models.Domain;

namespace TweedeZit
{
    // TellingDag is used to count ("tel") the number of presences of a training/swimming/opleidings day.
    // It contains a list of "Tijdvakken" (time slots) to keep track of the presences on a hourly basis.
    public class TellingDag
    {
        // properties (name and datum) + a list of time slots
        #region Properties

        public int TellingDagId { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Naam { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        [DataType(DataType.Date)]
        public DateTime Datum { get; set; }

        public virtual ICollection<Tijdvak> Tijdvakken { get; set; }
        #endregion


        #region Constructor

        // initialize the lists
        public TellingDag()
        {
            Tijdvakken = new List<Tijdvak>();
        }
        #endregion


        #region Methods

        // get a list of Tijdvakken (time slots) for a particular "TellingDay" (this class)
        public IEnumerable<Tijdvak> GetTijdvakken()
        {
            return Tijdvakken.OrderBy(t => t.Van).Select(t => t);
        }

        // get a Tijdvak object from a TijdvakID
        public Tijdvak GetTijdvak(int tijdvakId)
        {
            return Tijdvakken.FirstOrDefault(t => t.TijdvakId == tijdvakId);
        }
        #endregion
    }
}