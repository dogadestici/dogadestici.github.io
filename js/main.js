"use strict";

document.addEventListener("DOMContentLoaded", () => {
  if (typeof AOS !== "undefined") {
    AOS.init({
      once: true,
    });
  }

  // Sticky Header & GoToTop
  const header = document.querySelector("#header");
  const goToTop = document.querySelector("#goToTop");
  const hero = document.querySelector("#home") || document.querySelector(".hero") || document.querySelector(".academic-info-container");

  window.addEventListener("scroll", function () {
    let triggerHeight = hero ? (hero.offsetHeight > 170 ? hero.offsetHeight - 170 : 100) : 100;

    if (window.scrollY > triggerHeight) {
      if (header) header.classList.add("header-sticky");
      if (goToTop) goToTop.classList.add("reveal");
    } else {
      if (header) header.classList.remove("header-sticky");
      if (goToTop) goToTop.classList.remove("reveal");
    }
  });

  // Active Nav Links on Scroll
  let sections = document.querySelectorAll("section[id]");
  let headerNavLinks = document.querySelectorAll("header nav a");

  if (sections.length > 0 && headerNavLinks.length > 0) {
    window.addEventListener("scroll", () => {
      let top = window.scrollY;
      sections.forEach((sec) => {
        let offset = sec.offsetTop - 170;
        let height = sec.offsetHeight;
        let id = sec.getAttribute("id");

        if (id && top >= offset && top < offset + height) {
          headerNavLinks.forEach((link) => {
            if (link.getAttribute("href") && link.getAttribute("href").includes(id)) {
              link.classList.add("active");
            } else {
              link.classList.remove("active");
            }
          });
        }
      });
    });
  }
});
