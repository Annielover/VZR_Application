using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TweedeZit.Models.Domain
{
    // Cache manager for the weatherService
    public class InProcServiceCache<TItem> : ServiceCache<TItem>
    {
        public InProcServiceCache()
            : base()
        {
        }

      
        // Creates a new instance of this type, specifying a default cache lifetime.    
        public InProcServiceCache(TimeSpan cacheLifetime)
            : base(cacheLifetime)
        {
        }


        // Gets an enumeration of the currect things in cache.     
        public override IEnumerable<ServiceCacheItem<TItem>> CachedItems
        {
            get { return cachedItems; }
        }

        protected List<ServiceCacheItem<TItem>> cachedItems = new List<ServiceCacheItem<TItem>>();

      
        // Adds an item to the cache.
        public override void AddToCache(ServiceCacheItem<TItem> item)
        {
            if (item == null)
                throw new ArgumentNullException("item", "Argument \"item\" cannot be null.");

            cachedItems.Add(item);
        }

       
        // Removes an item from the cache.
        public override void RemoveFromCache(ServiceCacheItem<TItem> item)
        {
            if (item == null)
                throw new ArgumentNullException("item", "Argument \"item\" cannot be null.");

            cachedItems.Remove(item);
        }


        // Clears the cache of all items.
        public override void ClearCache()
        {
            cachedItems.Clear();
        }
    }
}