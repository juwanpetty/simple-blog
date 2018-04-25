$(document).on('turbolinks:load', function() {
    let slide = document.querySelectorAll('.slide');

    // gets the height of the element, including the margin
    let slideElement = window.getComputedStyle(slide[0]);
    let slideHeight = slide[0].offsetHeight + parseInt(slideElement.marginBottom);
    setPosition();

    let sliderWrapper = document.querySelector('.slider-wrapper');
    let slideList = document.querySelectorAll('.slider-nav > li');

    // grabs a number of how many slides there are
    const childrenNumber = slide.length;
    console.log(childrenNumber);

    sliderWrapper.style.height = (childrenNumber * slideHeight) + 'px'; 

    function setPosition() {
        slide.forEach(function(element, i) {
            // positions each slide in the slider
            element.style.transform = "translateY(" + slideHeight * i + "px)";
        });
    }

    // returns the index of the hovered element
    slideList.forEach(function(el, index) {
        el.addEventListener("mouseover", function() {
            setActive(el, index);
        });
    });

    function setActive(element, index){
        let hoveredIndex = index;
        
        // goes through list of slider navigation elements and remove .active class
        slideList.forEach(function(nav) {
            nav.classList.remove('active');
        });

        // add .active to the nav that was hovered
        element.classList.add('active');
        
        // moves the slide wrapper based on the index of the element hovered and height of the slides
        sliderWrapper.style.transform = "translateY(-" + hoveredIndex * slideHeight + "px) translateZ(0)";

        slide.forEach(function(slide) {
            slide.classList.remove('active');
        });
        slide[hoveredIndex].classList.add('active');
    }
});