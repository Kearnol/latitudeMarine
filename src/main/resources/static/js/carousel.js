const track = document.querySelector(".carousel__track");
const slides = Array.from(track.children);
const nextButton = document.querySelector(".carousel__button--right");
const prevButton = document.querySelector(".carousel__button--left");
const carouselNav = document.querySelector(".carousel__nav");
const dots = Array.from(carouselNav.children);
const slideWidth = slides[0].getBoundingClientRect().width;
const slideHeight = slides[0].getBoundingClientRect().height;

$(dots[0]).addClass("current-slide");

//========================
// HELPER METHODS
//========================

// arrange the slides next to one another
const setSlidePosition = (slide, index) =>{
    slide.style.left = slideWidth * index + "px";
};
slides.forEach(setSlidePosition);

const moveToSlide = (track, currentSlide, targetSlide) => {
    track.style.transform = "translateX(-" + targetSlide.style.left + ")";
    currentSlide.classList.remove("current-slide");
    targetSlide.classList.add("current-slide");
}

function checkSlideCount (nextButton){
	if (slides.length < 2){
		nextButton.classList.add("is-hidden");
	}
}


$(document).ready(checkSlideCount);
	

const hideShowArrows = (slides, prevButton, nextButton, targetIndex) => {
    if(targetIndex === 0) {
        prevButton.classList.add("is-hidden");
        nextButton.classList.remove("is-hidden");
    } else if (targetIndex === slides.length - 1){
        prevButton.classList.remove("is-hidden");
        nextButton.classList.add("is-hidden");
    } else {
        prevButton.classList.remove("is-hidden");
        nextButton.classList.remove("is-hidden");
    }
}

const updateDots =(currentDot, targetDot) => {
    currentDot.classList.remove("current-slide");
    targetDot.classList.add("current-slide");
}

//========================
// Slide Navigation Methods
//========================

//when I click left - move slides left
prevButton.addEventListener("click", e=>{
    const currentSlide = track.querySelector(".current-slide");
    const prevSlide = currentSlide.previousElementSibling;
    const currentDot = carouselNav.querySelector(".current-slide");
    const prevDot = currentDot.previousElementSibling;
    const targetIndex = slides.indexOf(prevSlide);
    moveToSlide(track, currentSlide, prevSlide);
    updateDots(currentDot, prevDot);
    hideShowArrows(slides, prevButton, nextButton, targetIndex)
});

//when I click right - move slides right
nextButton.addEventListener("click", e => { 
    const currentSlide = track.querySelector(".current-slide");
    const nextSlide = currentSlide.nextElementSibling;
    const currentDot = carouselNav.querySelector(".current-slide");
    const nextDot = currentDot.nextElementSibling;
    const nextIndex = slides.findIndex(slide => slide === nextSlide);

    moveToSlide(track, currentSlide, nextSlide);
    updateDots(currentDot, nextDot);
    hideShowArrows(slides, prevButton, nextButton, nextIndex)
});


//when I click slide navigators - move to that slide
carouselNav.addEventListener("click", e => { 
    //what indacator was clicked on
    const targetDot = e.target.closest("img");
    if(!targetDot) {console.log("none found"); return;}
    
    const currentSlide = track.querySelector(".current-slide");
    const currentDot = carouselNav.querySelector(".current-slide");
    const targetIndex = dots.findIndex(dot => dot === targetDot);
    const targetSlide = slides[targetIndex];
    
    moveToSlide(track, currentSlide, targetSlide);
    updateDots(currentDot, targetDot);
    hideShowArrows(slides, prevButton, nextButton, targetIndex)
})
/**
 * 
 */