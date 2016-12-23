document.addEventListener("DOMContentLoaded", () => {
  let navItems = Array.from(document.querySelectorAll(".sidebar-nav"));
  navItems.forEach(navItem => {
    navItem.addEventListener("click", () => {
      let name = navItem.innerText.toLowerCase();
      window.location.hash = name;
    });
  });
});
