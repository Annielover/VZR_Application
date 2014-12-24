using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using DotNetOpenAuth.Messaging;

namespace TweedeZit.Models.Domain
{
    // ----------------------------------------
    // LEERTRAJECT = ZWEMGROEP = SWIMMING GROUP
    // ----------------------------------------

    public class Leertraject
    {
        // Leertraject (swimming groep) has a collection (list) of Opleidingsdagen (days), Cursisten (swimmers), Aanwezigheden (presences)
        #region Properties

        public virtual ICollection<Opleidingsdag> Opleidingsdagen { get; set; }
        public virtual ICollection<Cursist> Cursisten { get; set; }
        public virtual ICollection<Aanwezigheid> Aanwezigheden { get; set; }

        public int LeertrajectId { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        [Display(Name = "Zwemgroep")]
        public string Titel { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Omschrijving { get; set; }

        #endregion

        // initialize all the lists
        public Leertraject()
        {
            Opleidingsdagen = new List<Opleidingsdag>();
            Cursisten = new List<Cursist>();
            Aanwezigheden = new List<Aanwezigheid>();
        }

        #region Methods

        // retrieve the swimming days of a swimming group
        public IEnumerable<Opleidingsdag> GetOpleidingsdagen()
        {
            return Opleidingsdagen.OrderBy(o => o.Date).Select(o => o);
        }

        // add a swimmer to a swimming group
        public void Add(Cursist cursist)
        {
            Cursisten.Add(cursist);
            Aanwezigheden.AddRange(Opleidingsdagen.Select(dag => new Aanwezigheid(cursist, dag)));
        }

        // add a training day to a swimming group
        public void Add(Opleidingsdag dag)
        {
            Opleidingsdagen.Add(dag);
            Aanwezigheden.AddRange(Cursisten.Select(curcist => new Aanwezigheid(curcist, dag)));
        }

        // remove a swimmer from a swimming group
        public void Remove(Cursist cursist)
        {
            Cursisten.Remove(cursist);
            foreach (Aanwezigheid aanwezigheid in Aanwezigheden.Where(a => a.Cursist == cursist).ToArray())
            {
                Aanwezigheden.Remove(aanwezigheid);
            }
        }

        // remove a training day from a swimming group
        public void Remove(Opleidingsdag dag)
        {
            Opleidingsdagen.Remove(dag);
            foreach (Aanwezigheid aanwezigheid in Aanwezigheden.Where(a => a.Dag == dag).ToArray())
            {
                Aanwezigheden.Remove(aanwezigheid);
            }
        }

        // get a list of presences of a specific day
        public IEnumerable<Aanwezigheid> GetAanwezigheidslijst(Opleidingsdag dag)
        {
            return Aanwezigheden.Where(a => a.Dag == dag).OrderBy(a => a.Cursist.Naam).Select(a => a);
        }

        // get a list of presences of a specific swimmer
        public IEnumerable<Aanwezigheid> GetAanwezigheidslijst(Cursist cursist)
        {
            return Aanwezigheden.Where(a => a.Cursist == cursist).Select(a => a);
        }

        // get the object "Day" from the dayID
        public Opleidingsdag GetDag(int dagId)
        {
            return Opleidingsdagen.Where(d => d.OpleidingsdagId == dagId).FirstOrDefault();
        }

        // get the object "Swimmer" of from a swimmerID
        public Cursist GetCursist(int cursistId)
        {
            return Cursisten.Where(c => c.CursistId == cursistId).FirstOrDefault();
        }

        // get a list of swimmers 
        public IEnumerable<Cursist> GetCursisten()
        {
            return Cursisten.OrderBy(c => c.Naam).ThenBy(c => c.Voornaam).Select(c => c);
        }

        // check if the swimmer was present for a specific day and get the status
        public bool IsAanwezig(Cursist cursist, Opleidingsdag dag)
        {
            return Aanwezigheden.Single(a => a.Dag == dag && a.Cursist == cursist).Aanwezig;
        }

        // set the presence of a swimmer on a specific day
        public void SetAanwezig(Cursist cursist, Opleidingsdag dag)
        {
            Aanwezigheden.Single(a => a.Dag == dag && a.Cursist == cursist).Aanwezig = true;
        }

        // set the absence of a swimmer on a specific day
        public void SetAfwezig(Cursist cursist, Opleidingsdag dag)
        {
            Aanwezigheden.Single(a => a.Dag == dag && a.Cursist == cursist).Aanwezig = false;
        }

        #endregion
    }
}