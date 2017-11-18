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

<% if(session.getAttribute("alert") == Alert.EDIT_LOGIN){%>
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

<% if(session.getAttribute("alert") == Alert.EDIT_PASSWORD){%>
<div class="alert alert-error alert-success" role="alert" id="loginAlert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
    <h4 class="alert-heading">Zmieniono hasło</h4>
    <p class="mb-0">Twoje hasło zostało zmienione. </p>
</div>
<%} %>

<userForm:form id="userForm" modelAttribute="user" action="save" method="get">
<div class="row">
    <div class="col-md-6">
        <div class="input" style="padding-bottom: 25px">
                <userForm:input id="editPasswordInput" path="password" type="text" class="form-control" placeholder="Password" required="" disabled="true"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="saveButton px-4" style="padding-bottom: 25px">
            <button id="passwordEditButton" type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
        </div>
    </div>
</div>
<div class="row" style="padding-bottom: 75px">
    <div class="col-md-6">
        <div class="input" style="padding-bottom: 25px">
            <input id="editPasswordRepeatInput" type="text" class="form-control" placeholder="Potwierdz Hasło" disabled="true"> </div>
    </div>
    <div class="col-md-6">
        <div class="saveButton px-4" style="padding-bottom: 25px">
            <button id="savePasswordButton" type="submit" class="btn btn-warning btn-block text-center p-2 text-white" disabled="false">Zapisz</button>
        </div>
    </div>
</div>
</userForm:form>


<div class="emailTitle text-center text-secondary p-4">
    <h2>EMAIL</h2>
</div>

<% if(session.getAttribute("alert") == Alert.EDIT_EMAIL){%>
<div class="alert alert-error alert-success" role="alert" id="loginAlert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
    <h4 class="alert-heading">Zmieniono email</h4>
    <p class="mb-0">Twój adres email został zmieniony. </p>
</div>

<%}else if(session.getAttribute("alert") == Alert.NOT_FOUND){ %>
<div class="alert alert-error alert-danger" role="alert" id="loginAlert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
    <h4 class="alert-heading">Nie udało się zmienić adresu email</h4>
    <p class="mb-0">Niestety konto o podanym <b>adresie</b> juz istnieje. Prosimy wybrać inny i spróbować ponownie. </p>
</div>
<%}%>

<userForm:form id="userForm" modelAttribute="account" action="saveAccount" method="get">

<div class="row">
    <div class="col-md-6">
        <div class="input" style="padding-bottom: 25px">
                <userForm:input id="editEmailInput" path="email" type="text" class="form-control" placeholder="Brak adresu Email" required="" disabled="true"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="saveButton px-4" style="padding-bottom: 25px">
            <button id="emailEditButton" type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
        </div>
    </div>
</div>
<div class="row" style="padding-bottom: 75px">
    <div class="col-md-6">
        <div class="input" style="padding-bottom: 25px">
            <input id="editEmailConfirmInput" type="text" class="form-control" placeholder="Potwierdz Email" disabled="true"> </div>
    </div>
    <div class="col-md-6">
        <div class="saveButton px-4" style="padding-bottom: 25px">
            <button id="saveEmailButton" type="submit" class="btn btn-warning btn-block text-center p-2 text-white" disabled="true">Zapisz</button>
        </div>
    </div>
</div>
</userForm:form>
