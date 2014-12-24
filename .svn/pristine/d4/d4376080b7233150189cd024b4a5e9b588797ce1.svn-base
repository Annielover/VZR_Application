using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace TweedeZit.Models.DAL.Mapper
{
    public class CursistMapper : EntityTypeConfiguration<Cursist>
    {
        public CursistMapper()
        {
            ToTable("Cursist");
            Property(p => p.Email).IsRequired().HasMaxLength(100);
            Property(p => p.Gemeente).IsRequired().HasMaxLength(50);
            Property(p => p.Naam).IsRequired().HasMaxLength(50);
            Property(p => p.Postcode).IsRequired();
            Property(p => p.Voornaam).IsRequired().HasMaxLength(50);
            Property(p => p.Straat).IsRequired().HasMaxLength(50);
            Property(p => p.Straatnummer).IsRequired().HasMaxLength(8);
            Property(p => p.Abonnement).IsRequired();
            Property(p => p.Geboortedatum).IsRequired();
            Property(p => p.Telefoon).IsRequired().HasMaxLength(30);
            Property(p => p.NaamMama).IsOptional().HasMaxLength(100);
            Property(p => p.NaamPapa).IsOptional().HasMaxLength(100);
        }
    }
}