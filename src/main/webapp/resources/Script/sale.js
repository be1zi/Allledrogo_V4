// $(function () {
//     $('#datetimepicker4').datetimepicker();
// });

$('#auctionTypeCheckbox').click(function () {

    if($('#auctionTypeCheckbox').is(':checked')){
        $('#priceAuction').attr('disabled',false);
    }else{
        $('#priceAuction').attr('disabled',true);
    }
});

$('#buyNowTypeCheckbox').click(function () {

    if($('#buyNowTypeCheckbox').is(':checked')){
        $('#priceBuyNow').attr('disabled', false);
    }else{
        $('#priceBuyNow').attr('disabled', true);
    }
});

    $(document).on('change', '.btn-file :file', function() {
        var input = $(this),
            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [label]);
    });

    $('.btn-file :file').on('fileselect', function(event, label) {

        var input = $(this).parents('.input-group').find(':text'),
            log = label;

        if( input.length ) {
            input.val(log);
        } else {
            if( log ) alert(log);
        }

    });

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img-upload').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }

        var div = document.createElement('div');

        div.className = 'col-md-3';

        div.innerHTML = ' <div class="form-group">\n' +
            '                <div class="input-group">\n' +
            '                    <span class="input-group-btn">\n' +
            '                        <span class="btn btn-warning text-white btn-file">\n' +
            '                            Wybierz... <input type="file" accept="image/png, image/jpeg, image/gif" id="imgInp2">\n' +
            '                        </span>\n' +
            '                    </span>\n' +
            '                    <input id=\'urlname\'type="text" class="form-control" readonly>\n' +
            '                </div>\n' +
            '                <div id="auctionImages">\n' +
            '                    <img id=\'img-upload\' name="imageSingleAuction"/>\n' +
            '                </div>\n' +
            '            </div>';

        document.getElementById('imageRow').appendChild(div);
    }

$("#imgInp1").change(function(){
    console.log("impInp1 change");
    readURL(this);
});

$("#imgInp2").change(function(){
    console.log("impInp2 change");
    readURL(this);
});
