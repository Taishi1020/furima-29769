window.addEventListener('DOMContentLoaded', () => {

 const ItemPrice = document.getElementById('item-price');
 
 const SaleScommission = document.getElementById('add-tax-price');
 const AlesProfit = document.getElementById('profit');

 
 ItemPrice.addEventListener("input", function() {
 
  let price = ItemPrice.value;
  const tax = Math.floor(price * 0.1 );
  const profit = Math.floor(price * 0.9 );
 
  //手数料と利益を貼り付ける
  SaleScommission.textContent = tax;
  AlesProfit.textContent = profit;
 });
});