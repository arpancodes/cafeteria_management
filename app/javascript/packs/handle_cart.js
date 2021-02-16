console.log("CONNECTED!");
const addToCart_buttons = document.querySelectorAll(".add_to_cart_btn");

console.log(addToCart_buttons);
function AddToCart() {
  console.log("CLICKED");
  console.log(this.dataset);
}

addToCart_buttons.forEach((button) =>
  button.addEventListener("click", AddToCart)
);
