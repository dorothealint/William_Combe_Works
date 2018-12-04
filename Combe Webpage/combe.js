function init() {
    var fieldset = document.getElementsByTagName ('input');
    for (var i = 0; i < fieldset.length; i++)
    {fieldset[i].addEventListener('click', toggle, false);}
}
function toggle() {
    var id = this.id;
    var italics = document.getElementsByClassName("emph");
    var chars = document.getElementsByClassName("persName");
    var places = document.getElementsByClassName("placeName");
    var signatures = document.getElementsByClassName("signature");
    var epigraphs = document.getElementsByClassName("epigraph");
    var letters = document.getElementsByClassName("letter");
    var bylines = document.getElementsByClassName("byline");
    switch (id) {
        case "ITALtoggle": {
            var k;
            for (var k = 0; k < italics.length; e++)
            {italics[k].classList.toggle("on")}
        };
        break;
        case "CHARtoggle": {
            var k;
            for (var k = 0; k < chars.length; e++)
            {chars[k].classList.toggle("on")}
        };
        break;
        case "PLtoggle": {
            var k;
            for (var k = 0; k < places.length; e++)
            {places[k].classList.toggle("on")}
        };
        break;
        case "SIGtoggle": {
            var k;
            for (var k = 0; k < signatures.length; e++)
            {signatures[k].classList.toggle("on")}
        };
        break;
        case "EPItoggle": {
            var k;
            for (var k = 0; k < epigraphs.length; e++)
            {epigraphs[k].classList.toggle("on")}
        };
        break;
        case "LETtoggle": {
            var k;
            for (var k = 0; k < letters.length; e++)
            {letters[k].classList.toggle("on")}
        };
        break;
        case "BYtoggle": {
            var k;
            for (var k = 0; k < bylines.length; e++)
            {bylines[k].classList.toggle("on")}
        };
        break;
    }
}
window.onload = init;