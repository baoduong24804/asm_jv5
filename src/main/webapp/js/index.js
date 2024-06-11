

$(document).ready(function () {

    $('.hover').off('click').click(function () {
        window.location.href = '/animu/listmovie';
    });

    var cookieValue = $.cookie('theme');


    if (cookieValue == 'white') {

        $('#theme').removeClass('theme-dark');
        $('#theme').addClass('theme-white');
        $('#webname').removeClass('theme-dark');
        $('#webname').addClass('theme-white');
        $('#body').removeClass('body-dark')
        $('#body').addClass('body-white')
    } else {

        $('#theme').removeClass('theme-white');
        $('#theme').addClass('theme-dark');
        $('#webname').removeClass('theme-white');
        $('#webname').addClass('theme-dark');
        $('#body').removeClass('body-white')
        $('#body').addClass('body-dark')
    }


    $('#theme').off('click').click(function () {
        if ($(this).hasClass('theme-dark')) {
            $.cookie('theme', 'white', { expires: 7, path: '/' });

            $(this).removeClass('theme-dark');
            $(this).addClass('theme-white');
            $('#webname').removeClass('theme-dark');
            $('#webname').addClass('theme-white');
            $('#body').removeClass('body-dark')
            $('#body').addClass('body-white')

        } else {
            $.cookie('theme', 'dark', { expires: 7, path: '/' });
            $(this).removeClass('theme-white');
            $(this).addClass('theme-dark');
            $('#webname').removeClass('theme-white');
            $('#webname').addClass('theme-dark');
            $('#body').removeClass('body-white')
            $('#body').addClass('body-dark')
        }
    });
});