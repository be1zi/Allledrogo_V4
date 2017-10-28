<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="accForm" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="userForm" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/register/register.css">

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
                        <form action="#" id="">
                            <div class="form-group">
                                <div class="alert alert-error alert-danger" role="alert" id="loginAlert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
                                    <h4 class="alert-heading">Nie udało się zarejestrować</h4>
                                    <p class="mb-0">Niestety konto o podanym <b>loginie</b> już istnieje. Prosimy wybrać inny i spróbować ponownie. </p>
                                </div> <label class="text-secondary">Login</label>
                                <input type="text" class="form-control" placeholder="Login" required=""> </div>
                            <div class="form-group">
                                <div class="alert alert-error alert-danger" role="alert" id="emailAlert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
                                    <h4 class="alert-heading">Nie udało się zarejestrować</h4>
                                    <p class="mb-0">Podany adres <b>email </b>jest już wykorzystywany. Prosimy wybrać inny i spróbować ponownie. </p>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"> <label class="text-secondary">Email</label>
                                        <input type="email" class="form-control" placeholder="Email" required=""> </div>
                                    <div class="col-md-6"> <label class="text-secondary">Powtórz Email</label>
                                        <input type="email" class="form-control" placeholder="Email" required=""> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="alert alert-error alert-danger" role="alert" id="passwordAlert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
                                    <h4 class="alert-heading">Nie udało się zarejestrować</h4>
                                    <p class="mb-0">Podane <b>hasła </b>nie są identyczne.&nbsp;</p>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"> <label class="text-secondary">Hasło</label>
                                        <input type="password" class="form-control" placeholder="Hasło" required=""> </div>
                                    <div class="col-md-6"> <label class="text-secondary">Powtórz hasło</label>
                                        <input type="password" class="form-control" placeholder="Hasło" required=""> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6"> <label class="text-secondary">Imię</label>
                                        <input type="text" class="form-control" placeholder="Imię" required=""> </div>
                                    <div class="col-md-6"> <label class="text-secondary">Nazwisko</label>
                                        <input type="text" class="form-control" placeholder="Nazwisko" required=""> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6"> <label class="text-secondary">Miasto</label>
                                        <input type="text" class="form-control" placeholder="Miasto" required=""> </div>
                                    <div class="col-md-6"> <label class="text-secondary">Państwo</label>
                                        <input type="text" class="form-control" placeholder="Państwo" required=""> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6"> <label class="text-secondary">Ulica</label>
                                        <input type="text" class="form-control" placeholder="Ulica"> </div>
                                    <div class="col-md-6"> <label class="text-secondary">Kod Pocztowy</label>
                                        <input type="text" class="form-control" placeholder="Kod Pocztowy" required=""> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6"> <label class="text-secondary">Numer Domu</label>
                                        <input type="number" class="form-control" placeholder="Numer Domu" required=""> </div>
                                    <div class="col-md-6"> <label class="text-secondary">Numer Lokalu</label>
                                        <input type="number" class="form-control" placeholder="Numer Lokalu"> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6"> <label class="text-secondary">Województwo</label>
                                        <input type="text" class="form-control" placeholder="Województwo" required=""> </div>
                                    <div class="col-md-6"> <label class="text-secondary">Numer Telefonu</label>
                                        <input type="tel" class="form-control" placeholder="Numer Telefonu" required=""> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="description"> <label class="text-secondary">Opis</label> <textarea class="form-control" rows="5" id="description" placeholder="Opis"></textarea> </div>
                            </div>
                            <div class="registerButton text-center" style="margin-top: 40px;">
                                <button type="submit" class="btn btn-warning text-white btn-lg btn-block">Zarejestruj</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>


<script src="webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
