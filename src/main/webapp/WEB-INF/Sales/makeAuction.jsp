<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="title">
    <div class="row text-left" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="form-group w-100">
            <h3 style="padding-bottom:10px" class="text-secondary text-center">Tytuł i kategoria:</h3>
            <input type="text" class="form-control" id="usr" placeholder="Tytuł"> </div>
    </div>
</div>
<div class="category">
    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-3" style="padding:0">
            <button type="button" class="btn btn-block btn-warning text-white">Wybierz kategorię</button>
        </div>
    </div>
</div>
<div class="photos">
    <div class="row" style="padding-left:30px;padding-right:30px; padding-bottom:20px">
        <div class="form-group w-100">
            <h3 style="padding-bottom:10px" class="text-secondary text-center">Zdjęcia:</h3>
        </div>
        <div class="form-group w-100"> </div>
    </div>


    <div class="row" id="imageRow">
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-btn">
                        <span class="btn btn-warning text-white btn-file">
                            Wybierz... <input type="file" accept="image/png, image/jpeg, image/gif" id="imgInp1">
                        </span>
                    </span>
                    <input id='urlname'type="text" class="form-control" readonly>
                </div>
                <div id="auctionImages">
                    <img id='img-upload' name="imageSingleAuction"/>
                </div>
            </div>
        </div>

    </div>



</div>
<div class="info">
    <div class="row" style="padding-left:30px;padding-right:30px; padding-bottom:20px">
        <div class="form-group w-100">
            <h3 style="padding-bottom:10px" class="text-secondary text-center">Informacje:</h3>
        </div>
    </div>


    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-6"> <label class="text-secondary">Stan:</label> </div>
        <div class="col-md-6">
            <%--<input class="form-control" id="usr" placeholder="Stan" type="text"  > --%>
                <select class="form-control" id="sel1">
                    <option>Wybierz</option>
                    <option>Nowy</option>
                    <option>Używany</option>
                </select>
        </div>
    </div>

    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-6"> <label class="text-secondary">Rok produkcji:</label> </div>
        <div class="col-md-6">
            <input class="form-control" id="usr" placeholder="Rok produkcji:" type="number"  min="1950"> </div>
    </div>

    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-6"> <label class="text-secondary">Kolor:</label> </div>
        <div class="col-md-6">
            <%--<input class="form-control" id="usr" placeholder="Kolor" type="text" > --%>
                <select class="form-control" id="sel1">
                    <option>Wybierz</option>
                    <option>Biały</option>
                    <option>Szary</option>
                    <option>Czarny</option>
                    <option>Czerwony</option>
                    <option>Żółty</option>
                    <option>Zielony</option>
                    <option>Niebieski</option>
                    <option>Fioletowy</option>
                    <option>Pomarańczowy</option>
                    <option>Brązowy</option>
                    <option>Różowy</option>
                    <option>Złoty</option>
                    <option>Srebrny</option>
                </select>

        </div>
    </div>

    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-6"> <label class="text-secondary">Uszkodzony:</label> </div>
        <div class="col-md-6">
            <%--<input class="form-control" id="usr" placeholder="Uszkodzony" type="text" >--%>
            <select class="form-control" id="sel1">
                <option>Wybierz</option>
                <option>Tak</option>
                <option>Nie</option>
            </select>
        </div>

    </div>

    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-6"> <label class="text-secondary">Gwarancja:</label> </div>
        <div class="col-md-6">
            <%--<input class="form-control" id="usr" placeholder="Gwarancja" type="text" > --%>
                <select class="form-control" id="sel1">
                    <option>Wybierz</option>
                    <option>Tak</option>
                    <option>Nie</option>
                </select>
        </div>
    </div>

    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-12">
            <div class="input">
                <label class="text-secondary">Opis:</label>
                <textarea rows="10" id="auctionDesscriptionLabel" path="description" type="text" class="form-control" placeholder="Opis..."  ></textarea>
            </div>
        </div>
    </div>


</div>
<div class="auctionDetails">
    <div class="row" style="padding-left:30px;padding-right:30px; padding-bottom:20px">
        <div class="form-group w-100">
            <h3 class="text-secondary text-center">Szczegóły aukcji:</h3>
        </div>
    </div>
    <div class="auctionType">
        <div class="row" style="padding-left:30px;padding-right:30px; padding-bottom:20px">
            <div class="col-md-6">
                <div class="checkbox">
                    <input type="checkbox" id="auctionTypeCheckbox" value="" class="" style="margin-right:15px; width:20px; height:20px; vertical-align: middle;"> <label class="text-secondary">Licytacja</label> </div>
            </div>
            <div class="col-md-6">
                <input class="form-control" id="priceAuction" placeholder="Kwota" type="number" disabled="disabled" min="1"> </div>
        </div>
    </div>
    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-6">
            <div class="checkbox">
                <input type="checkbox" id="buyNowTypeCheckbox" value="" class="" style=" margin-right:15px; width:20px; height:20px; vertical-align: middle;"> <label class="text-secondary">Kup Teraz</label> </div>
        </div>
        <div class="col-md-6">
            <input class="form-control" id="priceBuyNow" placeholder="Kwota" type="number" disabled="disabled" min="1"> </div>
    </div>
</div>
<div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
    <div class="col-md-6"> <label class="text-secondary">Liczba Sztuk:</label> </div>
    <div class="col-md-6">
        <input class="form-control" id="numberOfItems" placeholder="Liczba Sztuk" type="number"  min="1"> </div>
</div>
<div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
    <div class="col-md-6"> <label class="text-secondary">Data zakończenia</label> </div>
    <div class="col-md-6">
        <input type="text" class="form-control" id="datetimepicker4"> </div>
</div>