using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace TweedeZit.Models.DAL.Mapper
{
    public class TijdvakMapper : EntityTypeConfiguration<Tijdvak>
    {
        public TijdvakMapper()
        {
            ToTable("Tijdvak");
            Property(p => p.AantalZwemmers).IsRequired();
            Property(p => p.DagNaam).IsOptional();
            Property(p => p.Tot).IsRequired();
            Property(p => p.Van).IsRequired();
            Property(p => p.AantalBanen).IsRequired();
        }
    }
}