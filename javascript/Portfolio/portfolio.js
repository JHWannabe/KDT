// 1번
const menuBtn = document.querySelector(".navbar__toggle-btn");
const menuContainer = document.querySelector(".menu-container");
const menuNav = document.querySelector(".navbar__menu");
console.log(menuNav);
menuBtn.addEventListener("click", () => {
  menuContainer.classList.toggle("open");
  menuNav.classList.add("open");
});

// 2번
function goToScroll(name) {
  let location = document.querySelector("#" + name);
  menuid = "mn_" + location.id;
  window.scrollTo({ top: location.offsetTop - 50, behavior: "smooth" });
  clickmenu();
  select = document.getElementById(menuid);
  select.classList.add("active");
}

function clickmenu() {
  const menu = document.getElementsByTagName("li");
  for (let i = 0; i < menu.length; i++) {
    menu[i].classList.remove("active");
  }
}

const sections = document.querySelectorAll("section");
const navList = document.querySelectorAll(".navbar__menu__item");

window.addEventListener("scroll", () => {
  const scroll = window.scrollY;

  sections.forEach((data, i) => {
    if (scroll >= data.offsetTop - 70) {
      document.querySelector(".active").classList.remove("active");
      navList[i].classList.add("active");
    }
  });

  if (scroll == document.body.offsetHeight - window.innerHeight) {
    document.querySelector(".active").classList.remove("active");
    navList[navList.length - 1].classList.add("active");
  }
});

// 3번
const all = document.getElementsByClassName("project");
const fe = document.getElementsByClassName("fe");
const be = document.getElementsByClassName("be");
const ai = document.getElementsByClassName("ai");

document.getElementsByClassName("all__count")[0].innerText = all.length;
document.getElementsByClassName("fe__count")[0].innerText = fe.length;
document.getElementsByClassName("be__count")[0].innerText = be.length;
document.getElementsByClassName("ai__count")[0].innerText = ai.length;

function ProjectButtonClick(project, me) {
  const allCount = document.querySelectorAll(".project");
  const projectCount = document.querySelectorAll(project);
  const selected = document.querySelector(".selected");

  allCount.forEach((data) => {
    data.classList.add("invisible");
  });

  projectCount.forEach((data) => {
    data.classList.remove("invisible");
  });

  selected.classList.remove("selected");
  me.classList.add("selected");
}

// 4번
const btn = document.getElementsByClassName("arrow-up");
window.addEventListener("scroll", () => {
  const home = document.querySelector("#home");
  if (window.scrollY > home.offsetTop + home.offsetHeight) {
    for (let i = 0; i < btn.length; i++) {
      btn[i].classList.add("visible");
    }
  } else {
    for (let i = 0; i < btn.length; i++) {
      btn[i].classList.remove("visible");
    }
  }
});