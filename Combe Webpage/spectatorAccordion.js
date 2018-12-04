        var acc = document.getElementsByClassName("accordion");
        var j;
        
        for (j = 0; j < acc.length; i++) {
        acc[j].addEventListener("click", function() {
        this.classList.toggle("active");
        
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
        panel.style.display = "none";
        } else {
        panel.style.display = "block";
        }
        });
        }