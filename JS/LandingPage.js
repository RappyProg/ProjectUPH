var toggle_button;
var big_wrapper;
var drawer;

function declare() {
    toggle_button = document.querySelector(".toggle-button");
    big_wrapper = document.querySelector(".big-wrapper");
    drawer = document.querySelector(".drawer")
}
const main = document.querySelector("main");

declare();

let night = false;

function toggleAnimation() {
    night = !night;
    let clone = big_wrapper.cloneNode(true);
    if (night) {
        clone.classList.remove("day");
        clone.classList.add("night");
    } else {
        clone.classList.remove("night");
        clone.classList.add("day");
    }
    clone.classList.add("copy");
    main.appendChild(clone);

    clone.addEventListener("animationend", () => {
        big_wrapper.remove();
        clone.classList.remove("copy");
        declare();
        events();
    });
}

function events() {
    toggle_button.addEventListener('click', toggleAnimation);
    drawer.addEventListener('click', () => {
        big_wrapper.classList.toggle('active');
    });
}

events();