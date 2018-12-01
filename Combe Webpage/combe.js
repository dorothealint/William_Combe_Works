function init() {
    var fieldset = document.getElementsByTagName ('');
    for (var i = 0; i < fieldset.length; i++) {
        fieldset[i].addEventListener('click', toggle, false);
    }
}
function toggle() {
    var id = this.id;
    switch (id) {
        case "ITALtoggle": {
            var italics = document.getElemenetsByClassName("emph");
            for (var i = 0; i < italics.length; i++) {
                italics[i].classList.toggle("on")
            }
        };
        break;
        case "CHARtoggle": {
            var chars = document.getElementsByClassName("persName");
            for (var i = 0; i < chars.length; i++) {
                chars[i].classList.toggle("on")
            }
        };
        break;
        case "PLtoggle": {
            var places = document.getElementsByClassName("placeName");
            for (var i = 0; i < places.length; i++) {
                places[i].classList.toggle("on")
            }
        };
        break;
        case "SIGtoggle": {
            var signatures = document.getElementsByClassName("signatures");
            for (var i = 0; i < signatures.length; i++) {
                signatures[i].classList.toggle("on")
            }
        };
        break;
        case "EPItoggle": {
            var epigraph = document.getElementsByClassName("epigraph");
            for (var i = 0; i < epigraph.length; i++) {
                epigraph[i].classList.toggle("on")
            }
        };
        break;
        case "LETtoggle": {
            var letter = document.getElementsByClassName("letter");
            for (var i = 0; i < letter.length; i++) {
                letter[i].classList.toggle("on")
            }
        };
        break;
        case "BYtoggle": {
            var byline = document.getElementsByClassName("byline");
            for (var i = 0; i < byline.length; i++) {
                byline[i].classList.toggle("on")
            }
        };
        break;
    }
}
window.onload = init;