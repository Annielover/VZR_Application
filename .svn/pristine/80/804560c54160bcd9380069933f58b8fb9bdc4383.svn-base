using System.Data.Entity;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using TweedeZit.Models.Domain;

namespace TweedeZit.Models.DAL
{
    [ExcludeFromCodeCoverage]
    public class MedewerkerRepository : IMedewerkerRepository
    {
        private AanwezigheidsContext context;
        private DbSet<Medewerker> medewerkers;

        public MedewerkerRepository(AanwezigheidsContext context)
        {
            this.context = context;
            medewerkers = context.Medewerkers;
        }

        public Medewerker FindBy(string naam)
        {
            return medewerkers.SingleOrDefault(m => m.Naam.Equals(naam));
        }

        public IQueryable<Medewerker> FindAll()
        {
            return medewerkers.OrderBy(m => m.Naam);
        }

        public void Add(Medewerker medewerker)
        {
            medewerkers.Add(medewerker);
        }

        public void SaveChanges()
        {
            context.SaveChanges();
        }
    }
}