$('#editLoginButton').click(function () {
    $('#editLoginInput').prop('disabled', false);
})


$('#passwordEditButton').click(function () {
    $('#editPasswordInput').prop('disabled', false);
    $('#editPasswordRepeatInput').prop('disabled', false);
})

$('#emailEditButton').click(function () {
    $('#editEmailInput').prop('disabled', false);
    $('#editEmailConfirmInput').prop('disabled', false);
})

$('#editPasswordInput, #editPasswordRepeatInput').on('keyup', function () {
    if(($('#editPasswordInput').val() == $('#editPasswordRepeatInput').val()) && ($('#editPasswordRepeatInput').val() != null && $('#editPasswordRepeatInput').val() != '' )) {
        $('#editPasswordInput, #editPasswordRepeatInput').css('border-color', 'green');
        $('#savePasswordButton').attr('disabled', false)

    } else {
        $('#editPasswordInput, #editPasswordRepeatInput').css('border-color', 'red');
        $('#savePasswordButton').attr('disabled', true)
    }
});

$('#editEmailInput, #editEmailConfirmInput').on('keyup', function () {
    if(($('#editEmailInput').val() == $('#editEmailConfirmInput').val()) && ($('#editEmailConfirmInput').val() != null && $('#editEmailConfirmInput').val() != '' )) {
        $('#editEmailInput, #editEmailConfirmInput').css('border-color', 'green');
        $('#saveEmailButton').attr('disabled', false)

    } else {
        $('#editEmailInput, #editEmailConfirmInput').css('border-color', 'red');
        $('#saveEmailButton').attr('disabled', true)
    }
})