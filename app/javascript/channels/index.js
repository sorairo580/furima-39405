// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.addEventListener('load', function(){


  
  let input = document.getElementById("item-price")
  let taxSpan = document.getElementById("add-tax-price");
  let profitSpan = document.getElementById("profit");

  input.addEventListener('change', function(){
    let inputValue = parseFloat(input.value); 
    if (!isNaN(inputValue)) { // 数値であることを確認
      let taxPrice = inputValue * 0.1; // 税金を計算
      taxSpan.textContent = taxPrice;
      let profit = inputValue - taxPrice; // 税金を計算
      profitSpan.textContent = profit;
    } 
  })
})