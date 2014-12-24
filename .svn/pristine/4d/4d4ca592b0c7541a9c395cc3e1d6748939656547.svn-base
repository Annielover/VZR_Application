using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Diagnostics.CodeAnalysis;
using TweedeZit.Models.DAL.Mapper;

namespace TweedeZit.Models.DAL
{
    [ExcludeFromCodeCoverage]
    public class AanwezigheidsContext : DbContext
    {
        public AanwezigheidsContext()
            : base("Aanwezigheid")
        {
        }

        public DbSet<Medewerker> Medewerkers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Configurations.Add(new CursistMapper());
            modelBuilder.Configurations.Add(new OpleidingsdagMapper());
            modelBuilder.Configurations.Add(new TellingDagMapper());
            modelBuilder.Configurations.Add(new TijdvakMapper());
            modelBuilder.Configurations.Add(new ZwembadMapper());
        }
    }
}