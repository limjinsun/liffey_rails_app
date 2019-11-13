import axios from 'axios';
var numeral = require('numeral');

function getCurrency(){
    axios.get('https://api.exchangeratesapi.io/latest?symbols=KRW')
        .then(function (response) {
            var rate = response.data;
            console.log(rate.rates.KRW);

            var euroPrice = document.getElementById('price').textContent
            var conversionPrice = rate.rates.KRW * euroPrice
            document.getElementById('price').textContent = numeral(Math.round(conversionPrice/1000)*1000).format('0,0')


        })
        .catch(function (error) {
            console.log(error);
        })
        .then(function () {});
}

$(document).ready(function() {
    return getCurrency();
});
