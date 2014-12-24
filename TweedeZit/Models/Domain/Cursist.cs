﻿using System;
using System.ComponentModel.DataAnnotations;
using TweedeZit.Models.Domain;

namespace TweedeZit
{
    public class Cursist
    {
        //-------------------
        // CURSIST = SWIMMER
        //-------------------

        // A cursist contains an ID, Name, ... together with some restrictions.
        // For example, when registering a new swimmer (cursist), his or her name cannot be empty (= not filled in in the form)
        #region properties

        public int CursistId { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}",
            ErrorMessage = "E-mail adres heeft niet het correct formaat")]
        public string Email { get; set; }

        [Display(Name = "Familienaam")]
        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Naam { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Voornaam { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Straat { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Straatnummer { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public int Postcode { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Gemeente { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public DateTime Geboortedatum { get; set; }

        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public string Telefoon { get; set; }

        [Display(Name = "Abonnement verloopt op")]
        [Required(ErrorMessage = "{0} mag niet leeg zijn")]
        public DateTime Abonnement { get; set; }

        [Display(Name = "Naam mama")]
        public string NaamMama { get; set; }

        [Display(Name = "Naam papa")]
        public string NaamPapa { get; set; }

        #endregion

        public Leertraject GetLeertrajectCursist(int cursistId)
        {
            Medewerker medewerker = new Medewerker();
            Leertraject traject = new Leertraject();
            traject = medewerker.GetLeertrajectFromCursist(cursistId);
            return traject;
        }
    }
}