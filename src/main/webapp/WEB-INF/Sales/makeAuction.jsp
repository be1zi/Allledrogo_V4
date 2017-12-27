<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="auctionForm" uri="http://www.springframework.org/tags/form" %>


<div class="photos">
    <div class="row" style="padding-left:30px;padding-right:30px; padding-bottom:20px">
        <div class="form-group w-100">
            <h3 style="padding-bottom:10px" class="text-secondary text-center">Zdjęcia:</h3>
        </div>
        <div class="form-group w-100"></div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form id="upload-file-form" action="/sale/updateFiles" >
                    <input id="upload-file-input" type="file" name="uploadfile" accept="image/png, image/jpeg" />
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form id="upload-file-form2" action="/sale/updateFiles" >
                    <input id="upload-file-input2" type="file" name="uploadfile" accept="image/png, image/jpeg" />
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form id="upload-file-form3" action="/sale/updateFiles" >
                    <input id="upload-file-input3" type="file" name="uploadfile" accept="image/png, image/jpeg" />
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form id="upload-file-form4" action="/sale/updateFiles" >
                    <input id="upload-file-input4" type="file" name="uploadfile" accept="image/png, image/jpeg" />
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form id="upload-file-form5" action="/sale/updateFiles" >
                    <input id="upload-file-input5" type="file" name="uploadfile" accept="image/png, image/jpeg" />
                </form>
            </div>
        </div>
    </div>
</div>


<auctionForm:form id="auctionForm" modelAttribute="auctionModel" action="save" method="get"
                  enctype="multipart/form-data">
    <div class="title">
        <div class="row text-left" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
            <div class="form-group w-100">
                <h3 style="padding-bottom:10px" class="text-secondary text-center">Tytuł i kategoria:</h3>
                <auctionForm:input path="title" type="text" class="form-control" id="usr" placeholder="Tytuł"
                                   required="true"/>
            </div>
        </div>
    </div>
    <div class="category">
        <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
            <div class="col-md-12" style="padding:0">
                <auctionForm:select path="category" class="form-control" id="category" required="true">
                    <auctionForm:option value="Wybierz"></auctionForm:option>
                    <auctionForm:option value="Elektronika"></auctionForm:option>
                    <auctionForm:option value="Motoryzacja"></auctionForm:option>
                    <auctionForm:option value="Moda"></auctionForm:option>
                    <auctionForm:option value="Kultura"></auctionForm:option>
                    <auctionForm:option value="Dom"></auctionForm:option>
                    <auctionForm:option value="Ogród"></auctionForm:option>
                    <auctionForm:option value="Dziecko"></auctionForm:option>
                    <auctionForm:option value="Sport"></auctionForm:option>
                    <auctionForm:option value="Wypoczynek"></auctionForm:option>
                    <auctionForm:option value="Jedzenie"></auctionForm:option>
                    <auctionForm:option value="Sztuka"></auctionForm:option>
                    <auctionForm:option value="Usługi"></auctionForm:option>
                </auctionForm:select>
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
            <div class="col-md-6"><label class="text-secondary">Stan:</label></div>
            <div class="col-md-6">
                <auctionForm:select path="state" class="form-control" id="state" required="true">
                    <auctionForm:option value="Wybierz"></auctionForm:option>
                    <auctionForm:option value="Nowy"></auctionForm:option>
                    <auctionForm:option value="Używany"></auctionForm:option>
                </auctionForm:select>
            </div>
        </div>

        <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
            <div class="col-md-6"><label class="text-secondary">Rok produkcji:</label></div>
            <div class="col-md-6">
                <auctionForm:input path="productionDate" type="number" class="form-control" id="usr"
                                   placeholder="Rok produkcji:" min="1950" required="true"/>
            </div>
        </div>

        <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
            <div class="col-md-6"><label class="text-secondary">Kolor:</label></div>
            <div class="col-md-6">
                <auctionForm:select path="color" class="form-control" id="color" required="true">
                    <auctionForm:option value="Wybierz"></auctionForm:option>
                    <auctionForm:option value="Biały"></auctionForm:option>
                    <auctionForm:option value="Szary"></auctionForm:option>
                    <auctionForm:option value="Czarny"></auctionForm:option>
                    <auctionForm:option value="Czerwony"></auctionForm:option>
                    <auctionForm:option value="Żółty"></auctionForm:option>
                    <auctionForm:option value="Zielony"></auctionForm:option>
                    <auctionForm:option value="Niebieski"></auctionForm:option>
                    <auctionForm:option value="Fioletowy"></auctionForm:option>
                    <auctionForm:option value="Pomarańczowy"></auctionForm:option>
                    <auctionForm:option value="Brązowy"></auctionForm:option>
                    <auctionForm:option value="Różowy"></auctionForm:option>
                    <auctionForm:option value="Złoty"></auctionForm:option>
                    <auctionForm:option value="Srebrny"></auctionForm:option>
                </auctionForm:select>
            </div>
        </div>

        <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
            <div class="col-md-6"><label class="text-secondary">Uszkodzony:</label></div>
            <div class="col-md-6">
                <auctionForm:select path="damaged" class="form-control" id="damaged" required="true">
                    <auctionForm:option value="Wybierz"></auctionForm:option>
                    <auctionForm:option value="Tak"></auctionForm:option>
                    <auctionForm:option value="Nie"></auctionForm:option>
                </auctionForm:select>
            </div>
        </div>

        <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
            <div class="col-md-6"><label class="text-secondary">Gwarancja:</label></div>
            <div class="col-md-6">
                <auctionForm:select path="warranty" class="form-control" id="warranty" required="true">
                    <auctionForm:option value="Wybierz"></auctionForm:option>
                    <auctionForm:option value="Tak"></auctionForm:option>
                    <auctionForm:option value="Nie"></auctionForm:option>
                </auctionForm:select>
            </div>
        </div>

        <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
            <div class="col-md-12">
                <div class="input">
                    <label class="text-secondary">Opis:</label>
                    <auctionForm:textarea path="description" class="form-control" rows="10" id="description"
                                          placeholder="Opis..." required="true"></auctionForm:textarea>
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
                        <input type="checkbox" id="auctionTypeCheckbox" value="" class=""
                               style="margin-right:15px; width:20px; height:20px; vertical-align: middle;">
                        <label class="text-secondary">Licytacja</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <auctionForm:input path="biddingPrice" type="number" class="form-control" id="priceAuction"
                                       placeholder="Kwota" disabled="true" min="1" required="" step="0.01"/>
                </div>
            </div>
        </div>
        <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
            <div class="col-md-6">
                <div class="checkbox">
                    <input type="checkbox" id="buyNowTypeCheckbox" value="" class=""
                           style=" margin-right:15px; width:20px; height:20px; vertical-align: middle;">
                    <label class="text-secondary">Kup Teraz</label>
                </div>
            </div>
            <div class="col-md-6">
                <auctionForm:input path="buyNowPrice" type="number" class="form-control" id="priceBuyNow"
                                   placeholder="Kwota" disabled="true" min="1" required="" step="0.01"/>
            </div>
        </div>
    </div>
    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-6"><label class="text-secondary">Liczba Sztuk</label></div>
        <div class="col-md-6">
            <auctionForm:input path="itemNumber" type="number" class="form-control" id="numberOfItems"
                               placeholder="Liczba Sztuk:" min="1" required="true"/>
        </div>
    </div>
    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-6">
            <label class="text-secondary">Data zakończenia</label>
        </div>
        <div class="col-md-6">
            <auctionForm:input path="tmpDate" type="text" cssClass="form-control" id="datetimepicker12" required = "true"/>
        </div>
    </div>

    <div class="row" style="padding-left:30px; padding-right:30px; padding-bottom:20px">
        <div class="col-md-12">
            <button id="makeAuctionButton" type="submit" class="btn btn-block btn-warning text-white">Wystaw</button>
        </div>
    </div>


</auctionForm:form>
