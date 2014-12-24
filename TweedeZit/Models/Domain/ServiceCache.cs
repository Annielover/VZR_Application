using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace TweedeZit.Models.Domain
{
    public abstract class ServiceCache<TItem>
    {

        #region Methods
        // Creates a new instance of this type. Defaults the cache lifetime to 10 minutes.
        protected ServiceCache()
        {
            this.CacheLifetime = new TimeSpan(0, 10, 0);
        }


        // Creates a new instance of this type. Defaults the cache lifetime to the specified 
        // cacheLifeTime: the length of time for which items in the cache should 
        // be considered valid. Afterwards, the items beyond this time span will be considered 
        // stale and removed from cache.
        protected ServiceCache(TimeSpan cacheLifetime)
            : this()
        {
            this.CacheLifetime = cacheLifetime;
        }


        // Gets or sets the length of time the items in the cache are considered good. 
        public TimeSpan CacheLifetime { get; set; }


        // Gets an enumeration of the currect things in cache.
        public abstract IEnumerable<ServiceCacheItem<TItem>> CachedItems { get; }


        // Gets an item from the cache. If it is not there, will execute <see cref="CacheMiss"/> 
        public TItem GetResult(String key)
        {
            if (String.IsNullOrEmpty(key))
                throw new ArgumentException("Argument \"key\" cannot be null or empty.", "key");

            PruneCache();

            ServiceCacheItem<TItem> cachedItem =
                CachedItems.Where(item => item.Key.Equals(key, StringComparison.CurrentCultureIgnoreCase))
                    .FirstOrDefault();

            return ProcessCacheSearchOutcome(key, cachedItem);
        }


        // Prunes away (removes) all stale items in cache
        public virtual void PruneCache()
        {
            IEnumerable<ServiceCacheItem<TItem>> expiredItems = CachedItems.Where(item =>
                DateTime.Now.Subtract(item.TimeCaptured).TotalMinutes > CacheLifetime.TotalMinutes);

            ServiceCacheItem<TItem>[] expiredItemsArray = expiredItems.ToArray();

            for (int index = 0; index < expiredItemsArray.Length; index++)
            {
                Debug.WriteLine("Removing item from cache... " + expiredItemsArray[index].Key);
                RemoveFromCache(expiredItemsArray[index]);
            }
        }

        // Gets or sets the function pointer to use, if the item key is not found in the cache.
        public Func<String, ServiceCacheItem<TItem>> CacheMiss { get; set; }


        // Abstract: In a derived class, adds an item to the cache store.
        public abstract void AddToCache(ServiceCacheItem<TItem> item);


        /// Abstract: In a derived class, removes an item from the cache store.
        public abstract void RemoveFromCache(ServiceCacheItem<TItem> item);


        // Abstract: In a derived class, removes all items from the cache.
        public abstract void ClearCache();



        #region Private Support Members

        /// Establish whether the <paramref name="cachedItem"/> we got from cache is valid or not.
        private TItem ProcessCacheSearchOutcome(String key, ServiceCacheItem<TItem> cachedItem)
        {
            if (String.IsNullOrEmpty(key))
                throw new ArgumentException("Argument \"key\" cannot be null or empty.", "key");

            if (cachedItem == null)
            {
                Debug.WriteLine("Item \"" + key + "\" NOT found in cache. Cache age is set to: " + CacheLifetime);
                ServiceCacheItem<TItem> newItem = CacheMiss(key);
                AddToCache(newItem);

                return newItem.Value;
            }
            else
            {
                Debug.WriteLine("Item \"" + key + "\" found in cache - using it. " +
                                DateTime.Now.Subtract(cachedItem.TimeCaptured) + " minutes old.");
                return cachedItem.Value;
            }
        }

        #endregion
        #endregion
    }
}