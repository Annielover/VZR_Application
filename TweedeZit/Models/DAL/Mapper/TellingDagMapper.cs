using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace TweedeZit.Models.DAL.Mapper
{
    public class TellingDagMapper : EntityTypeConfiguration<TellingDag>
    {
        public TellingDagMapper()
        {
            ToTable("TellingDag");
            Property(p => p.Datum).IsRequired().HasColumnType("datetime2");
            Property(p => p.Naam).IsRequired().HasMaxLength(30);
        }
    }
}