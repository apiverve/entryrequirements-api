using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.TravelEntryRequirements
{
    /// <summary>
    /// Query options for the Travel Entry Requirements API
    /// </summary>
    public class TravelEntryRequirementsQueryOptions
    {
        /// <summary>
        /// The destination country or territory: a two-letter ISO code such as TH, or an English name such as Thailand
        /// </summary>
        [JsonProperty("destination")]
        public string Destination { get; set; }

        /// <summary>
        /// Trip arrival date (YYYY-MM-DD), for passportCheck
        /// </summary>
        [JsonProperty("arrivalDate")]
        public string ArrivalDate { get; set; }

        /// <summary>
        /// Trip departure date (YYYY-MM-DD), for passportCheck
        /// </summary>
        [JsonProperty("departureDate")]
        public string DepartureDate { get; set; }

        /// <summary>
        /// The traveler's passport expiry date (YYYY-MM-DD); passportCheck says whether it meets the destination's rule
        /// </summary>
        [JsonProperty("passportExpiry")]
        public string PassportExpiry { get; set; }
    }
}
