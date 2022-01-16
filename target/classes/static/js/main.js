var contactUs = $("#contactUs");
var hero = $("#hero");
var shop = $("#shop");
var aboutUs = $("#about");
var service = $("#service");
var ourServices = $("#ourServices")
var whoWeAre = $("#whoWeAre");

contactUs.click(()=>{
    $('html, body').animate({
        scrollTop: hero.offset().top
    }, 500);
});

aboutUs.click(()=>{
    $('html, body').animate({
        scrollTop: whoWeAre.offset().top
    }, 500);
});

service.click(()=>{
    $('html, body').animate({
        scrollTop: ourServices.offset().top
    }, 500)
})

