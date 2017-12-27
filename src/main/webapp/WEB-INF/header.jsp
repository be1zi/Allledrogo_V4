<%@ page import="com.belzowski.Support.Enum.MenuStatus" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">

<nav class="navbar sticky-top navbar-expand-md bg-primary navbar-dark p-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><i class="fa fa-lg fa-cloud text-secondary d-inline"></i><b id="brand" class="text-secondary">&nbsp; ALLLEDROGO</b></a>
        <button class="navbar-toggler navbar-toggler-right" href="/" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent"
                aria-controls="navbar2SupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="collapse navbar-collapse justify-content-center text-center" id="navbar2SupportedContent">
            <div class="col-md-7 text-center">
                <form class="form-inline m-0">
                    <div class="search navbar-collapse justify-content-end">
                        <input class="form-control mr-4 text-left w-50" type="text" placeholder="Szukaj">
                        <button class="btn btn-warning text-white text-center" type="submit" data-toggle=""><i class="fa d-inline fa-lg fa-search"></i>&nbsp; Szukaj</button>
                    </div>
                </form>
            </div>
            <div class="col-md-5">
            <div class="collapse navbar-collapse justify-content-end text-center">

                <% if(session.getAttribute("menuStatus") == MenuStatus.login){ %>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/register" id="registerButton"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp; Zarejestruj</a>
                <%}else if (session.getAttribute("menuStatus") == MenuStatus.register){%>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/login" data-toggle=""><i class="fa d-inline fa-lg fa-unlock"></i>&nbsp; Zaloguj</a>
                <% }else if(session.getAttribute("menuStatus") == MenuStatus.isLogout) {%>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/register" id="registerButton"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp; Zarejestruj</a>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/login" data-toggle=""><i class="fa d-inline fa-lg fa-unlock"></i>&nbsp; Zaloguj</a>
                <% }else {%>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/shopping/"><i class="fa fa-fw fa-shopping-basket"></i>&nbsp; Zakupy</a>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/sale/"><i class="fa fa-money"></i>&nbsp; Sprzedaż</a>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/myaccount/"><i class="fa fa-user-o"></i>&nbsp; Moje Konto</a>
                    <a class="btn navbar-btn ml-2 text-white btn-warning" href="/logout" data-toggle=""><i class="fa d-inline fa-lg fa-unlock"></i>&nbsp; Wyloguj</a>
                <% } %>
            </div>
            </div>
        </div>
    </div>
</nav>

<div class="row">
        <div class="container-fluid">
            <div class="row border border-success">
                <div class="col-md-1 border border-success">
                        <a href="/auction/list/Elektronika">
                            <div class="row justify-content-center">
                                <div class="icon p-3"> <i class="fa fa-desktop fa-3x"></i> </div>
                            </div>
                            <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                                <div class="name">
                                    <h6>Elektronika</h6>
                                </div>
                            </div>
                        </a>
                </div>

                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-car fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6>Motoryzajca</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-tags fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6>Moda</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-book fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6 class="text-center">Kultura</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-home fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6 class="text-center">Dom</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-envira fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6 class="text-center">Ogród</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-futbol-o fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6 class="text-center">Dziecko</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-bicycle fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6 class="text-center">Sport</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-plane fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6 class="text-center">Wypoczynek</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-cutlery fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6 class="text-center">Jedzenie</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-paint-brush fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6 class="text-center">Sztuka</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 border border-success">
                    <div class="row justify-content-center">
                        <div class="icon p-3"> <i class="fa fa-at fa-3x"></i> </div>
                    </div>
                    <div class="row justify-content-center text-secondary" style="padding-bottom: 10px">
                        <div class="name">
                            <h6 class="text-center">Usługi</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</div>