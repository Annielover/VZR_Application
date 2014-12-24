using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TweedeZit.Models.Domain
{
    public class ServiceCacheItem<TValue>
    {

        #region Methods

        // constructor
        public ServiceCacheItem()
        {
            this.TimeCaptured = DateTime.Now;
        }

        // Gets or sets the key, or unique identifier for this item.
        public String Key { get; set; }


        // Gets or sets the cached value.
        public TValue Value { get; set; }


        // Gets the time this item was captured into cache.
        public DateTime TimeCaptured { get; protected set; }

 
        // Returns a string that represents the current object.
        public override string ToString()
        {
            return String.Format("Key=\"{0}\"; TimeCaptured=\"{1}\"; Value=\"{2}\"", Key, TimeCaptured, Value);
        }

        #endregion
    }
}