function count (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const tax = Math.floor(inputValue * 0.1);
    
    addTaxPrice.innerHTML = tax;
    profit.innerHTML = Math.floor(inputValue - tax);
  });
};

window.addEventListener('turbo:load', count);