<%@ page import="com.belzowski.Support.Enum.Alert" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="accForm" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="userForm" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/home.css">
    <link rel="stylesheet" href="../resources/CSS/footer.css">

    <title>ALLLEDROGO</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="py-5 bg-primary">
    <div class="container">
        <div class="row">
            <div class="col-md-2"> </div>
            <div class="col-md-8">
                <div class="card text-white p-6 bg-primary">
                    <div class="card-body border border-success p-5">
                        <h1 class="mb-4 text-center text-secondary" style="padding-bottom: 20px">Zarejestruj</h1>
                        <userForm:form modelAttribute="userModel" action="save" method="post">
                            <div class="form-group">

                                <% if (session.getAttribute("alert") == Alert.FOUND){%>
                                <div class="alert alert-error alert-danger" role="alert" id="loginAlert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
                                    <h4 class="alert-heading">Nie udało się zarejestrować</h4>
                                    <p class="mb-0">Niestety konto o podanym <b>loginie</b> już istnieje. Prosimy wybrać inny i spróbować ponownie. </p>
                                </div>
                                <% } %>

                                <label class="text-secondary">Login</label>
                                <userForm:input path="login" type="text" class="form-control" placeholder="Login" required=""/>
                            </div>
                            <div class="form-group">
                                <div class="alert alert-error alert-danger collapse" role="alert" id="passwordAlert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
                                    <h4 class="alert-heading">Błąd</h4>
                                    <p class="mb-0">Podane <b>hasła </b>nie są identyczne.&nbsp;</p>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="text-secondary">Hasło</label>
                                        <userForm:input path="password" type="password" class="form-control" placeholder="Hasło" required="" id="password"/>
                                    </div>
                                    <div class="col-md-6"> <label class="text-secondary">Powtórz hasło</label>
                                        <input type="password" class="form-control" placeholder="Hasło" required="" id="confirmPassword">
                                    </div>
                                </div>
                            </div>
                            <accForm:form modelAttribute="accountModel" action="save">
                            <div class="form-group">
                                <div class="alert alert-error alert-danger collapse" role="alert" id="emailAlert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
                                    <h4 class="alert-heading">Błąd</h4>
                                    <p class="mb-0">Podany adres <b>email </b>jest już wykorzystywany. Prosimy wybrać inny i spróbować ponownie. </p>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="text-secondary">Email</label>
                                        <accForm:input path="email" type="email" class="form-control" placeholder="Email" required="" id="email"/>
                                    </div>
                                    <div class="col-md-6"> <label class="text-secondary">Powtórz Email</label>
                                        <input type="email" class="form-control" placeholder="Email" required="" id="confirmEmail">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="text-secondary">Imię</label>
                                        <accForm:input path="firstName" type="text" class="form-control" placeholder="Imię" required=""/> </div>
                                    <div class="col-md-6">
                                        <label class="text-secondary">Nazwisko</label>
                                        <accForm:input path="lastName" type="text" class="form-control" placeholder="Nazwisko" required=""/> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="text-secondary">Miasto</label>
                                        <accForm:input path="city" type="text" class="form-control" placeholder="Miasto" required=""/> </div>
                                    <div class="col-md-6">
                                        <label class="text-secondary">Państwo</label>
                                        <accForm:input path="country" type="text" class="form-control" placeholder="Państwo" required=""/> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="text-secondary">Ulica</label>
                                        <accForm:input path="street" type="text" class="form-control" placeholder="Ulica"/> </div>
                                    <div class="col-md-6">
                                        <label class="text-secondary">Kod Pocztowy</label>
                                        <accForm:input path="zipCode" type="text" class="form-control" placeholder="Kod Pocztowy" required=""/> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="text-secondary">Numer Domu</label>
                                        <accForm:input path="houseNumber" type="number" class="form-control" placeholder="Numer Domu" required="" min = "0" /> </div>
                                    <div class="col-md-6">
                                        <label class="text-secondary">Numer Lokalu</label>
                                        <accForm:input path="placeNumber" type="number" class="form-control" placeholder="Numer Lokalu" min = "0" /> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="text-secondary">Województwo</label>
                                        <accForm:input path="voivodeship" type="text" class="form-control" placeholder="Województwo" required=""/> </div>
                                    <div class="col-md-6">
                                        <label class="text-secondary">Numer Telefonu</label>
                                        <accForm:input path="phone" type="tel" class="form-control" placeholder="Numer Telefonu" required=""/> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="description">
                                    <label class="text-secondary">Opis</label>
                                    <accForm:textarea path="description" class="form-control" rows="5" id="description" placeholder="Opis"></accForm:textarea> </div>
                            </div>
                            <div class="registerButton text-center" style="margin-top: 40px;">
                                <button type="submit" class="btn btn-warning text-white btn-lg btn-block">Zarejestruj</button>
                            </div>
                            </accForm:form>
                        </userForm:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="../resources/Script/register.js"></script>
</body>
</html>
