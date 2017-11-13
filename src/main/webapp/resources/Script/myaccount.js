$('#editLoginButton').click(function () {
    $('#editLoginInput').prop('disabled', false);
})


$('#passwordEditButton').click(function () {
    $('#editPasswordInput').prop('disabled', false);
    $('#editPasswordRepeatInput').prop('disabled', false);
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