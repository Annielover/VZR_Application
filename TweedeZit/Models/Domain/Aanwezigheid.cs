namespace TweedeZit
{
    public class Aanwezigheid
    {
        #region constructors
        // Default controller
        public Aanwezigheid()
        {
        }

        // An Aanwezigheid (presence) consists of a Cursist (swimmer) and a Dag (day).
        public Aanwezigheid(Cursist cursist, Opleidingsdag dag)
        {
            Cursist = cursist;
            Dag = dag;
        }
        #endregion 

        #region properties

        //An aanwezigheid contains an ID, a Cursist, a Dag and a boolean indicating if a swimmer is present. (true = present, false = absent)
        public int AanwezigheidId { get; set; }
        public virtual Cursist Cursist { get; set; }
        public virtual Opleidingsdag Dag { get; set; }
        public bool Aanwezig { get; set; }

        #endregion
    }
}