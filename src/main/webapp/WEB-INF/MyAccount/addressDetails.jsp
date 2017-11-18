<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="userForm" uri="http://www.springframework.org/tags/form" %>

<userForm:form id="userForm" modelAttribute="account" action="saveAccount" method="get">

<div class="row" style="padding-bottom: 50px">
    <div class="col-md-12">
        <div class="editButton px-4">
            <button id="addressEditButton" type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
        </div>
    </div>
</div>
<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Imię</h4>
            <userForm:input id="firstNameLabel" path="firstName" type="text" class="form-control" placeholder="Imię" disabled="true" required=""></userForm:input>
        </div>
    </div>
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Nazwisko</h4>
            <userForm:input id="lastNameLabel" path="lastName" type="text" class="form-control" placeholder="Nazwisko" disabled="true" required=""></userForm:input>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Państwo</h4>
            <userForm:input id="countryLabel" path="country" type="text" class="form-control" placeholder="Państwo" disabled="true" required=""></userForm:input>
        </div>
    </div>
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Miasto</h4>
            <userForm:input id="cityLabel" path="city" type="text" class="form-control" placeholder="Miasto" disabled="true" required=""></userForm:input>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Ulica</h4>
            <userForm:input id="streetLabel" path="street" type="text" class="form-control" placeholder="Ulica" disabled="true" required=""></userForm:input>
        </div>
    </div>
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Kod pocztowy</h4>
            <userForm:input id="zipCodeLabel" path="zipCode" type="text" class="form-control" placeholder="Kod pocztowy" disabled="true" required=""></userForm:input>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Numer domu</h4>
            <userForm:input id="houseNumberLabel" path="houseNumber" type="text" class="form-control" placeholder="Numer domu" disabled="true" required=""></userForm:input>
        </div>
    </div>
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Numer mieszkania</h4>
            <userForm:input id="placeNumberLabel" path="placeNumber" type="text" class="form-control" placeholder="Numer mieszkania" disabled="true"></userForm:input>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Województwo</h4>
            <userForm:input id="voivodeshipLabel" path="voivodeship" type="text" class="form-control" placeholder="Województwo" disabled="true" required=""></userForm:input>
        </div>
    </div>
    <div class="col-md-6">
        <div class="input">
            <h4 class="text-secondary">Telefon</h4>
            <userForm:input id="phoneLabel" path="phone" type="text" class="form-control" placeholder="Telefon" disabled="true" required=""></userForm:input>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 50px">
    <div class="col-md-12">
        <div class="input">
            <h4 class="text-secondary">Opis</h4>
            <userForm:textarea rows="5" id="desscriptionLabel" path="description" type="text" class="form-control" placeholder="Opis..." disabled="true" ></userForm:textarea>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-12">
        <div class="editButton px-4">
            <button id="saveAccountButton" type="submit"  class="btn btn-warning btn-block text-center p-2 text-white">Zapisz</button>
        </div>
    </div>
</div>

</userForm:form>
