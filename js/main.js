"use strict";
import form from "./form.js";
import skillbar from "./skillbar.js";

document.addEventListener("DOMContentLoaded", () => {
  if (typeof AOS !== "undefined") {
    AOS.init({
      once: true,
    });
  }

  form();
  skillbar();

  const nav = document.querySelector("#nav");
  const navBtn = document.querySelector("#nav-btn");
  const navBtnImg = document.querySelector("#nav-btn-img");

  const isEnPage = window.location.pathname.includes("/en/");
  const openIconPath = isEnPage ? "../img/icons/open.svg" : "img/icons/open.svg";
  const closeIconPath = isEnPage ? "../img/icons/close.svg" : "img/icons/close.svg";

  // Hamburger menu toggle
  if (navBtn && nav) {
    navBtn.onclick = (e) => {
      e.stopPropagation();
      const isOpen = nav.classList.toggle("open");
      if (navBtnImg) {
        navBtnImg.src = isOpen ? closeIconPath : openIconPath;
      }
    };

    // Close menu when a link is clicked
    const navLinks = nav.querySelectorAll("a");
    navLinks.forEach((link) => {
      link.addEventListener("click", () => {
        nav.classList.remove("open");
        if (navBtnImg) {
          navBtnImg.src = openIconPath;
        }
      });
    });

    // Close menu when clicking outside
    document.addEventListener("click", (e) => {
      if (nav.classList.contains("open") && !nav.contains(e.target) && !navBtn.contains(e.target)) {
        nav.classList.remove("open");
        if (navBtnImg) {
          navBtnImg.src = openIconPath;
        }
      }
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
