import axios from 'axios';
var numeral = require('numeral');

function getCurrency(){
    axios.get('https://api.exchangeratesapi.io/latest?symbols=KRW')
        .then(function (response) {
            var rate = response.data;
            console.log(rate.rates.KRW);
            document.querySelectorAll(".schoolPrice").forEach(x => {
                console.log(x.textContent) // before conversion
                var number = rate.rates.KRW * x.textContent
                x.textContent = numeral(Math.round(number/1000)*1000).format('0,0')
                console.log(x.textContent) // after conversion
            });
        })
        .catch(function (error) {
            console.log(error);
        })
        .then(function () {});
}

$(document).ready(function() {
    return getCurrency();
});