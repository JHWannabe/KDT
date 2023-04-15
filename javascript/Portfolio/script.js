function clickmenu() {
    const menu = document.getElementsByTagName("li");
    for (let i = 0; i < menu.length; i++) {
        menu[i].classList.remove("active");
    }
}

function goToScroll(name) {
    let location = document.querySelector("#" + name);
    menuid = 'mn_' + location.id
    window.scrollTo({ top: location.offsetTop - 50, behavior: "smooth" });
    clickmenu();
    select = document.getElementById(menuid)
    select.classList.add("active");
}

function clicktab(select) {
    const menu = document.getElementsByClassName("category__btn");
    for (let i = 0; i < menu.length; i++) {
        menu[i].classList.remove("selected");
    }
    let location = document.getElementById(select);
    location.classList.add("selected");


    const all = document.querySelectorAll("[data-group]");
    const values = document.querySelectorAll("[data-value]");

    values.forEach((el) => {
        el.addEventListener("click", function (event) {
            const val = event.target.dataset.value;
            [...all].forEach((el) => {
            let arr = el.dataset.group.split(" ")
            for (let a of arr) {
                if (a == val) {
                    console.log(a)
                    el.setAttribute("class", "project")
                    break
                } else {
                    el.setAttribute("class", "project invisible")
                }
            }
            })
        })
    })
}




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

function openClose() {
    if (document.getElementById("navbar__menu").style.display === "block") {
        document.getElementById("navbar__menu").style.display = "none";
    } else {
        document.getElementById("navbar__menu").style.display = "block";
    }
}