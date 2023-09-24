window.addEventListener('load', function(){

  let input = document.getElementById("item-price")
  let taxSpan = document.getElementById("add-tax-price");
  let profitSpan = document.getElementById("profit");

  input.addEventListener('change', function(){
    let inputValue = parseFloat(input.value); 
    if (!isNaN(inputValue)) { 
      let taxPrice = inputValue * 0.1; 
      taxPrice = Math.floor(taxPrice); 
      taxSpan.textContent = taxPrice;
      let profit = inputValue - taxPrice; 
      profitSpan.textContent = profit;
    } 
  })
})