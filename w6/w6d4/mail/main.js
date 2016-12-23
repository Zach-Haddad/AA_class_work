let Router = require("./router");
// let Compose = require("./compose");
let Inbox = require("./inbox");
// let Sent = require("./sent");

let routes = {
  // compose: Compose,
  inbox: Inbox,
  // sent: Sent
};


document.addEventListener("DOMContentLoaded", () => {
  let content = document.querySelector(".content");
  let router = new Router(content, routes);
  router.start();

  let navItems = Array.from(document.querySelectorAll(".sidebar-nav"));
  navItems.forEach(navItem => {
    navItem.addEventListener("click", () => {
      let name = navItem.innerText.toLowerCase();
      window.location.hash = name;
    });
  });
});
