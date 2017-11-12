<%@taglib prefix="userForm" uri="http://www.springframework.org/tags/form" %>


<div class="loginTitle text-center text-secondary p-4">
    <h2> LOGIN </h2>
</div>
<div class="row" style="padding-bottom: 75px">
    <div class="col-md-6">
        <div class="input">
            <userForm:form id="userForm" modelAttribute="user" action="#" method="get">
                <userForm:input path="login" type="text" class="form-control" placeholder="Login" required="" disabled="true"/>
            </userForm:form>
        </div>
    </div>
    <div class="col-md-3">
        <div class="editButton px-4">
            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
        </div>
    </div>
    <div class="col-md-3">
        <div class="editButton px-4">
            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Zapisz</button>
        </div>
    </div>
</div>
<div class="passwordTitle text-center text-secondary p-4">
    <h2>HASLO</h2>
</div>
<div class="row" style="padding-bottom: 75px">
    <div class="col-md-6">
        <div class="input " style="padding-bottom: 25px">
            <userForm:form id="userForm" modelAttribute="user" action="#" method="get">
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