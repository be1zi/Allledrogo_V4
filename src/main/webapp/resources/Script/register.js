$('#password, #confirmPassword').on('keyup', function () {
    if(($('#password').val() == $('#confirmPassword').val()) ||$ ('#confirmPassword').val() == null || $('#confirmPassword').val() == '' ) {
        $('#password, #confirmPassword').css('border-color', 'green');
        $('#passwordAlert').hide()

    } else {
        $('#password, #confirmPassword').css('border-color', 'red');
        $('#passwordAlert').show()
    }
});

$('#email, #confirmEmail').on('keyup', function () {
    if(($('#email').val() == $('#confirmEmail').val()) || $('#confirmEmail').val() == null || $('#confirmEmail').val() == '' )  {
        $('#email, #confirmEmail').css('border-color', 'green');
        $('#emailAlert').hide()

    } else {
        $('#email, #confirmEmail').css('border-color', 'red');
        $('#emailAlert').show()
    }
});

