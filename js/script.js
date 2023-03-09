const header = document.querySelector("header");

window.addEventListener("scroll",function (){
    header.classList.toggle("sticky", window.scrollY > 0);
});

let menu = document.querySelector('#menu-icon');
let navegacion = document.querySelector('.navegacion');

menu.onclick = () => {
    menu.classList.toggle("bx-x");
    navegacion.classList.toggle("open");
};

window.onscroll = () => {
    menu.classList.remove('bx-x');
    navegacion.classList.remove('open');
};