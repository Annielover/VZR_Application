using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace TweedeZit.Models.Domain
{
    public static class WeatherServiceProvider
    {
        #region Properties
        // The cache provider for weather data.
        private static ServiceCache<String> serviceCache = new InProcServiceCache<String>();
        #endregion

        #region Constructor
        // Constructor
        static WeatherServiceProvider()
        {
            // key of the external service provider
            ApiKey = "589d053edef5ea6e";

            TimeSpan cacheDuration = new TimeSpan(0, 10, 0);

            String cacheDurationString = ConfigurationManager.AppSettings["wundergroundCacheDuration"];

            if (!String.IsNullOrEmpty(cacheDurationString))
                cacheDuration = TimeSpan.Parse(cacheDurationString);

            serviceCache.CacheMiss = GetWeatherFromInternetService;
            serviceCache.CacheLifetime = cacheDuration;
        }
        #endregion

        #region Methods
        // Gets or sets the current API key to use with the weather service.
        public static String ApiKey { get; set; }

        // Retrieves a JSON dynamic object, given the specified <paramref name="postalCode"/>.
        public static String GetWeather(String postalCode)
        {
            if (String.IsNullOrEmpty(postalCode))
                throw new ArgumentException("Argument \"postalCode\" cannot be null or empty.", "postalCode");

            return serviceCache.GetResult(postalCode);
        }


        // Calls the actual, underlying service to go get fresh data.
        private static ServiceCacheItem<String> GetWeatherFromInternetService(String postalCode)
        {
            if (String.IsNullOrEmpty(postalCode))
                throw new ArgumentException("Argument \"postalCode\" cannot be null or empty.", "postalCode");

            if (String.IsNullOrEmpty(ApiKey))
                throw new InvalidOperationException(
                    "The 'wundergroundApiKey' value in <appSettings> is missing. Cannot continue. Visit http://www.wunderground.com/weather/api/ to get a key.");

            String url = String.Format("http://api.wunderground.com/api/{0}/conditions/q/{1}.json", ApiKey, postalCode);
            WebRequest request = WebRequest.Create(url);
            using (WebResponse response = request.GetResponse())
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    return new ServiceCacheItem<String>() {Key = postalCode, Value = reader.ReadToEnd()};
                }
            }
        }
        #endregion
    }
}