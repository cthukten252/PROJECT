document.addEventListener('DOMContentLoaded', function () {
    var header = document.getElementById('siteHeader');
    var toggle = document.getElementById('navToggle');
    var nav = document.querySelector('.main-nav');

    function onScroll() {
        if (!header) return;
        if (window.scrollY > 10) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    }
    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();

    if (toggle && nav) {
        toggle.addEventListener('click', function () {
            nav.classList.toggle('open');
        });
    }

    if (nav) {
        var current = window.location.pathname.toLowerCase();
        var links = nav.querySelectorAll('a');
        for (var i = 0; i < links.length; i++) {
            if (links[i].pathname.toLowerCase() === current) {
                links[i].classList.add('active');
            }
        }
    }
});