//= require rails-ujs
const Chat = require("./chat")
document.addEventListener("DOMContentLoaded", () => {
  if (document.querySelector(".chat")) {
    window.chat = new Chat();
  }
});
