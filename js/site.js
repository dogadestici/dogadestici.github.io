"use strict";

AOS.init();

function toggleCvMenu(event) {
  event.stopPropagation();
  var menu = document.getElementById("cvDropdownMenu");
  menu.style.display = menu.style.display === "block" ? "none" : "block";
}

window.onclick = function() {
  var menu = document.getElementById("cvDropdownMenu");
  if (menu && menu.style.display === "block") {
    menu.style.display = "none";
  }
};

function copyPythonCode() {
  const isEnPage = document.documentElement.lang === "en";
  const codeText = document.getElementById("pythonCodeBlock").innerText;
  navigator.clipboard.writeText(codeText).then(() => {
    const btn = document.querySelector(".copy-code-btn");
    btn.textContent = isEnPage ? "✓ Copied!" : "✓ Kopyalandı!";
    setTimeout(() => {
      btn.textContent = isEnPage ? "📋 Copy Code" : "📋 Kodu Kopyala";
    }, 2000);
  });
}

(function() {
  const toggleBtn = document.getElementById("darkModeToggle");
  if (!toggleBtn) return;

  if (localStorage.getItem("dark-mode") === "enabled") {
    document.body.classList.add("dark-mode");
    toggleBtn.textContent = "◒ LIGHT";
  }

  toggleBtn.addEventListener("click", () => {
    document.body.classList.toggle("dark-mode");
    const isDark = document.body.classList.contains("dark-mode");
    localStorage.setItem("dark-mode", isDark ? "enabled" : "disabled");
    toggleBtn.textContent = isDark ? "◒ LIGHT" : "◑ MODE";
  });
})();

document.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector("#nav");
  const navBtn = document.querySelector("#nav-btn");
  const navBtnImg = document.querySelector("#nav-btn-img");

  const isEnPage = window.location.pathname.includes("/en/");
  const openIconPath = isEnPage ? "../img/icons/open.svg" : "img/icons/open.svg";
  const closeIconPath = isEnPage ? "../img/icons/close.svg" : "img/icons/close.svg";

  if (navBtn && nav) {
    navBtn.onclick = (e) => {
      e.stopPropagation();
      const isOpen = nav.classList.toggle("open");
      if (navBtnImg) {
        navBtnImg.src = isOpen ? closeIconPath : openIconPath;
      }
    };

    const navLinks = nav.querySelectorAll("a");
    navLinks.forEach((link) => {
      link.addEventListener("click", () => {
        nav.classList.remove("open");
        if (navBtnImg) {
          navBtnImg.src = openIconPath;
        }
      });
    });

    document.addEventListener("click", (e) => {
      if (nav.classList.contains("open") && !nav.contains(e.target) && !navBtn.contains(e.target)) {
        nav.classList.remove("open");
        if (navBtnImg) {
          navBtnImg.src = openIconPath;
        }
      }
    });
  }
});
