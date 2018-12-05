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
    var opener = document.getElementsByClassName("opener");
    var dash = document.getElementsByClassName("longdash");
    var poem = document.getElementsByClassName("poem");
    var closer = document.getElementsByClassName("closer");
    switch (id) {
        case "ITALtoggle": {
            var i;
            for (var i = 0; i < italics.length; i++)
            {italics[i].classList.toggle("on")}
        };
        break;
        case "CHARtoggle": {
            var i;
            for (var i = 0; i < chars.length; i++)
            {chars[i].classList.toggle("on")}
        };
        break;
        case "PLtoggle": {
            var i;
            for (var i = 0; i < places.length; i++)
            {places[i].classList.toggle("on")}
        };
        break;
        case "SIGtoggle": {
            var i;
            for (var i = 0; i < signatures.length; i++)
            {signatures[i].classList.toggle("on")}
        };
        break;
        case "EPItoggle": {
            var i;
            for (var i = 0; i < epigraphs.length; i++)
            {epigraphs[i].classList.toggle("on")}
        };
        break;
        case "LETtoggle": {
            var i;
            for (var i = 0; i < letters.length; i++)
            {letters[i].classList.toggle("on")}
        };
        break;
        case "BYtoggle": {
            var i;
            for (var i = 0; i < bylines.length; i++)
            {bylines[i].classList.toggle("on")}
        };
        break;
        case "OPENtoggle": {
            var i;
            for (var i = 0; i < opener.length; i++)
            {opener[i].classList.toggle("on")}
        };
        break;
        case "LDtoggle": {
            var i;
            for (var i = 0; i < dash.length; i++)
            {dash[i].classList.toggle("on")}
        };
        break;
        case "POEMtoggle": {
            var i;
            for (var i = 0; i < poem.length; i++)
            {poem[i].classList.toggle("on")}
        };
        break;
        case "CLOStoggle": {
            var i;
            for (var i = 0; i < closer.length; i++)
            {closer[i].classList.toggle("on")}
        };
        break;
    }
}
window.onload = init;