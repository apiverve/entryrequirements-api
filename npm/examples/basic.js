/**
 * Basic Example - Travel Entry Requirements API
 *
 * This example demonstrates how to use the Travel Entry Requirements API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const entryrequirementsAPI = require('../index.js');

// Initialize the API client
const api = new entryrequirementsAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
var query = {
  destination: "TH",
  arrivalDate: "2027-03-01",
  departureDate: "2027-03-15",
  passportExpiry: "2027-07-01"
};

// Make the API request using callback
console.log('Making request to Travel Entry Requirements API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});
