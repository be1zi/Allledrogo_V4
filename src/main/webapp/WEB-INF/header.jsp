<%@ page import="com.belzowski.Support.Enum.MenuStatus" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="../resources/CSS/header/css.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">

<nav class="navbar sticky-top navbar-expand-md bg-primary navbar-dark p-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><i class="fa fa-lg fa-cloud text-secondary d-inline"></i><b id="brand" class="text-secondary">&nbsp; ALLLEDROGO</b></a>
        <button class="navbar-toggler navbar-toggler-right" href="/" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent"
                aria-controls="navbar2SupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="collapse navbar-collapse justify-content-center text-center" id="navbar2SupportedContent">
            <div class="collapse navbar-collapse justify-content-end text center">
                <form class="form-inline m-0">
                    <input class="form-control mr-3" type="text" placeholder="Search">
                    <button class="btn btn-warning text-white" type="submit" data-toggle=""><i class="fa d-inline fa-lg fa-search"></i>&nbsp; Search</button>
                </form>
            </div>
            <div class="collapse navbar-collapse justify-content-end text-center">

                <% if(session.getAttribute("menuStatus") == MenuStatus.login){ %>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/register" id="registerButton"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp; Zarejestruj</a>
                <%}else if (session.getAttribute("menuStatus") == MenuStatus.register){%>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/login" data-toggle=""><i class="fa d-inline fa-lg fa-unlock"></i>&nbsp; Zaloguj</a>
                <% }else if(session.getAttribute("menuStatus") == MenuStatus.isLogout) {%>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/register" id="registerButton"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp; Zarejestruj</a>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/login" data-toggle=""><i class="fa d-inline fa-lg fa-unlock"></i>&nbsp; Zaloguj</a>
                <% }else {%>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/shopping/" id="registerButton"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp; Zakupy</a>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/sale/" id="registerButton"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp; Sprzedaz</a>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/myaccount/" id="registerButton"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp; Moje Konto</a>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/logout" data-toggle=""><i class="fa d-inline fa-lg fa-unlock"></i>&nbsp; Wyloguj</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>