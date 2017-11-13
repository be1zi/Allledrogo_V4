<%@ page import="com.belzowski.Support.Enum.Alert" %>
<%@taglib prefix="userForm" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="loginTitle text-center text-secondary p-4">
    <h2> LOGIN </h2>
</div>

<% if(session.getAttribute("alert") == Alert.FOUND){%>
    <div class="alert alert-error alert-danger" role="alert" id="loginAlert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
    <h4 class="alert-heading">Nie udało się zmienić loginu</h4>
    <p class="mb-0">Niestety konto o podanym <b>loginie</b> juz istnieje. Prosimy wybrać inny i spróbować ponownie. </p>
    </div>
<%} %>

<% if(session.getAttribute("alert") == Alert.EDIT){%>
<div class="alert alert-error alert-success" role="alert" id="loginAlert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
    <h4 class="alert-heading">Zmieniono login</h4>
    <p class="mb-0">Twój login został zmieniony. </p>
</div>
<%} %>

<userForm:form id="userForm" modelAttribute="user" action="save" method="get">

<div class="row" style="padding-bottom: 75px">
    <div class="col-md-6">
        <div class="input">
                <userForm:input id="editLoginInput" path="login" type="text" class="form-control" placeholder="Login" required="" disabled="true"/>
        </div>
    </div>
    <div class="col-md-3">
        <div class="editButton px-4">
            <button id="editLoginButton" type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
        </div>
    </div>
    <div class="col-md-3">
        <div class="editButton px-4">
                <button id="saveLoginButton" type="submit" class="btn btn-warning btn-block text-center p-2 text-white">Zapisz</button>
        </div>
    </div>
</div>
</userForm:form>

<div class="passwordTitle text-center text-secondary p-4">
    <h2>HASLO</h2>
</div>
<div class="row" style="padding-bottom: 75px">
    <div class="col-md-6">
        <userForm:form id="userForm" modelAttribute="user" action="#" method="get">
        <div class="input " style="padding-bottom: 25px">
                <userForm:input path="password" type="text" class="form-control" placeholder="Obecne Haslo" required="" disabled="true"/>
            </userForm:form>
        </div>
        <div class="input" style="padding-bottom: 25px">
            <input type="text" class="form-control" placeholder="Nowe Haslo" disabled="true"> </div>
        <div class="input" style="padding-bottom: 25px">
            <input type="text" class="form-control" placeholder="Powtorz Nowe Haslo" disabled="true"> </div>
    </div>
    <div class="col-md-6">
        <div class="editButton p-4">
            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
        </div>
        <div class="saveButton p-4">
            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Zapisz</button>
        </div>
    </div>
</div>
<div class="emailTitle text-center text-secondary p-4">
    <h2>EMAIL</h2>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="input" style="padding-bottom: 25px">
            <userForm:form id="userForm" modelAttribute="account" action="#" method="get">
                <userForm:input path="email" type="text" class="form-control" placeholder="Brak adresu Email" required="" disabled="true"/>
            </userForm:form>
        </div>
    </div>
    <div class="col-md-6">
        <div class="saveButton px-4" style="padding-bottom: 25px">
            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
        </div>
    </div>
</div>
<div class="row" style="padding-bottom: 75px">
    <div class="col-md-6">
        <div class="input" style="padding-bottom: 25px">
            <input type="text" class="form-control" placeholder="Potwierdz Email" disabled="true"> </div>
    </div>
    <div class="col-md-6">
        <div class="saveButton px-4" style="padding-bottom: 25px">
            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Zapisz</button>
        </div>
    </div>
</div>