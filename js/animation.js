//Cabmbia el color del "Div" al pasar el mouse
function ingresarMouse(event) {
    document.getElementById('areaTrabajo').style.backgroundColor = 'rgba(0, 0, 0, 0.6)';
}
function salirMouse(event) {
    document.getElementById('areaTrabajo').style.backgroundColor = 'rgb(255, 255, 255,0.0)';
}

//Cursor del mouse
var cursor = document.getElementById(
    'cursor');
document.addEventListener('mousemove'
    , function (e) {
        var x = e.clientX;
        var y = e.clientY;
        cursor.style.left = x + "px"
        cursor.style.top = y + "px"
    });

//Transciiones
var counter = 1;
setInterval(function () {
    document.getElementById('radio' + counter).cheked = true;
    counter++;
    if (counter > 4) {
        counter = 1;
    }
}, 5000);

//Menu responsive
(function ($) {
    $(function () {
        $('nav ul li a:not(:only-child)').click(function (e) {
            $(this).siblings('.nav-dropdown').toggle();
            $('.dropdown').not($(this).siblings()).hide();
            e.stopPropagation();
        });
        $('html').click(function () {
            $('.nav-dropdown').hide();
        });
        $('#nav-toggle').click(function () {
            $('nav ul').slideToggle();
        });
        $('#nav-toggle').on('click', function () {
            this.classList.toggle('active');
        });
    });
})(jQuery);

//array de rutas de imagenes

var lista_imagen = new Array('/img/docente2.jpg', '/img/docente3.jpg', '/img/docente4.jpg');
var galeria = document.getElementById('album');
var indice = 0;

function temporizador() {
    setInterval(cambiar_imagen, 2000);
}

function cambiar_imagen() {
    indice++;
    if (indice >= lista_imagen.length) {
        indice = 0;
    }
    galeria.src = lista_imagen[indice];

}
/*carrusel testimonio 
document.getElementById('next').onclick= function(){
    const widthItem = document.querySelector('.item').offsetWidth;
    document.getElementById('formlist').scrollLeft += widthItem;
}
document.getElementById('prev').onclick= function(){
    const widthItem = document.querySelector('.item').offsetWidth;
    document.getElementById('formlist').scrollLeft += widthItem;
}*/