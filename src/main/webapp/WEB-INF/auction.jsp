<%@ page import="com.belzowski.Model.UserModel" %>
<%@ page import="com.belzowski.Model.BiddingModel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/home.css">
    <link rel="stylesheet" href="../resources/CSS/footer.css">

    <title>ALLLEDROGO</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


<div class="p-5 text-center text-white">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="mb-4 text-secondary">${auction.title}</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                    <div class="mainPhoto">
                        <c:choose>
                            <c:when test="${mainImages eq 'photoPlaceholder'}">
                                <img  src="../resources/images/photoPlaceholder.jpg" class="d-block img-fluid w-100"/>
                            </c:when>
                            <c:otherwise>
                                <img  src="data:image/jpeg;base64,${mainImages}" class="d-block img-fluid w-100"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
            </div>
        </div>
    </div>
</div>
<div class="">
    <div class="container">

        <hr class="style-seven"/>

        <div class="row">
            <div class="col-md-6">
                <div class="buyNow">
                    <div class="row p-3">
                        <div class="col-md-4 text-left"> <label class="text-secondary">Data zakończenia:</label> </div>
                        <div class="col-md-8 text-left"> <label class="text-secondary">${auction.tmpDate}</label> </div>
                    </div>
                </div>
                <div class="buyNow">
                    <div class="row p-3">
                        <div class="col-md-4 text-left"> <label class="text-secondary">Dostępne sztuki:</label> </div>
                        <div class="col-md-8 text-left"> <label class="text-secondary">${auction.itemNumber}</label> </div>
                    </div>
                </div>
                <div class="buyNow">
                    <div class="row p-3">
                        <div class="col-md-4 text-left"> <label class="text-secondary">Sprzedający:</label> </div>
                        <div class="col-md-8 text-left"> <label class="text-secondary">TestowySprzedający</label> </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <c:choose>
                    <c:when test="${not empty auction.buyNowPrice}">
                        <div class="buyNow">
                            <div class="row p-3">
                                <div class="col-md-4 text-center"> <label class="text-secondary">${auction.buyNowPrice} zł </label> </div>
                                <div class="col-md-4 text-center">
                                    <c:choose>
                                        <c:when test="${auction.itemNumber == 1}">
                                            <input type="number" id="itemNumberInput" class="form-control" placeholder="Ilość sztuk" required="" min="1" max="${auction.itemNumber}" value="1" disabled="true">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="number" id="itemNumberInput" class="form-control" placeholder="Ilość sztuk" required="" min="1" max="${auction.itemNumber}" value="1">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-4 text-center">
                                    <button type="button" class="btn btn-warning p-2 text-white text-center btn-block" data-toggle="modal" data-target="#buyNowModal">Kup Teraz</button>
                                </div>

                                <div class="modal fade" id="buyNowModal" role="dialog">
                                    <div class="modal-dialog">
                                        <%
                                            UserModel userModel = (UserModel)session.getAttribute("user");
                                            if(userModel != null){
                                        %>
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Kup Teraz</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Czy jesteś pewny, że chcesz kupić ten przedmiot?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" id="buyNowButton" class="btn btn-warning text-white" data-dismiss="modal">Potwierdzam</button>
                                                    <button type="button" class="btn btn-warning text-white" data-dismiss="modal">Anuluj</button>
                                            </div>
                                        </div>
                                        <%}else{ %>
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Błąd</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Najpierw musisz się <b>zalogować </b>. Jeżeli jeszcze nie masz konta <b>zarejestruj się</b>.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <a class="btn navbar-btn ml-2 text-white btn-warning" href="/login" data-toggle=""><i class="fa d-inline fa-lg fa-unlock"></i>&nbsp; Zaloguj</a>
                                                <a class="btn navbar-btn ml-2 text-white btn-warning" href="/register" id="registerButton"><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp; Zarejestruj</a>
                                                <button type="button" class="btn btn-warning text-white" data-dismiss="modal" href="/auction/buyNow">Anuluj</button>
                                            </div>
                                        </div>
                                        <%}%>

                                    </div>
                                </div>

                                    <%--<% if(session.getAttribute("shopping") != null && session.getAttribute("shopping") != Shopping.DEFAULT) { %>--%>
                                        <%--<% if(session.getAttribute("shopping") == Shopping.SUCCESS) { %>--%>
                                             <%--<div id="snackbar">Kupiono przedmiot. Po szczegóły zajrzyj do zakładki <b>Kupione</b></div>--%>
                                        <%--<%}else if(session.getAttribute("shopping") == Shopping.FAILURE){ %>--%>
                                            <%--<div id="snackbar">Coś poszło nie tak. Spróbuj ponownie za chwilę.</div>--%>
                                        <%--<%}else if(session.getAttribute("shoppiing").equals(Shopping.OWNAUCTION)){%>--%>
                                            <%--<div id="snackbar">Nie możesz kupić własnego przedmiotu.</div>--%>
                                        <%--<%}%>--%>
                                 <%--<% } %>--%>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${not empty auction.biddingPrice}">
                        <div class="payInfo">
                            <div class="row p-3">
                                <div class="col-md-4">
                                    <input type="number" id="biddingPriceInput" class="form-control" placeholder="Cena" required="" min="${auction.biddingPrice}" step="0.01" value="${auction.biddingPrice}"> </div>
                                <div class="col-md-4 text-center">
                                    <c:choose>
                                        <c:when test="${auction.itemNumber == 1}">
                                            <input type="number" id="itemNumberInputBidding" class="form-control" placeholder="Ilość sztuk" required="" min="1" max="${auction.itemNumber}" value="1" disabled="true">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="number" id="itemNumberInputBidding" class="form-control" placeholder="Ilość sztuk" required="" min="1" max="${auction.itemNumber}" value="1">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-4 text-center">
                                    <button type="button" class="btn btn-warning p-2 text-white text-center btn-block" data-toggle="modal" data-target="#biddingModal">Licytuj</button>
                                </div>

                                <div class="modal fade" id="biddingModal" role="dialog">
                                    <div class="modal-dialog">
                                        <%
                                            UserModel userModel = (UserModel)session.getAttribute("user");
                                            if(userModel != null){
                                        %>
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Licytuj</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Czy jesteś pewny, że chcesz zalicytować ten przedmiot?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" id="biddingButton" class="btn btn-warning text-white" data-dismiss="modal">Potwierdzam</button>
                                                <button type="button" class="btn btn-warning text-white" data-dismiss="modal">Anuluj</button>
                                            </div>
                                        </div>
                                        <%}else{ %>
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Błąd</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Najpierw musisz się <b>zalogować </b>. Jeżeli jeszcze nie masz konta <b>zarejestruj się</b>.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <a class="btn navbar-btn ml-2 text-white btn-warning" href="/login" data-toggle=""><i class="fa d-inline fa-lg fa-unlock"></i>&nbsp; Zaloguj</a>
                                                <a class="btn navbar-btn ml-2 text-white btn-warning" href="/register" ><i class="fa d-inline fa-lg fa-user-circle-o"></i>&nbsp; Zarejestruj</a>
                                                <button type="button" class="btn btn-warning text-white" data-dismiss="modal" href="/auction/buyNow">Anuluj</button>
                                            </div>
                                        </div>
                                        <%}%>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>

        <hr class="style-seven"/>

        <div class="row py-3">
            <div class="col-md-6">
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Stan:</label> </div>
                        <div class="col-md-8 text-left"><label class="text-secondary">${auction.state}</label> </div>
                    </div>
                </div>
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Uszkodzony:</label> </div>
                        <c:choose>
                            <c:when test="${auction.damaged eq 'Tak'}">
                                <div class="col-md-8 text-left"><label class="text-secondary"><i class="fa fa-check" aria-hidden="true"></i></label> </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-md-8 text-left"><label class="text-secondary"><i class="fa fa-times" aria-hidden="true"></i></label> </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Kolor:</label> </div>
                        <div class="col-md-8 text-left"><label class="text-secondary">${auction.color}</label> </div>
                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Rok produkcji:</label> </div>
                        <div class="col-md-8 text-left"><label class="text-secondary">${auction.productionDate}</label> </div>
                    </div>
                </div>
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Gwarancja:</label> </div>
                        <c:choose>
                            <c:when test="${auction.warranty eq 'Tak'}">
                                <div class="col-md-8 text-left"><label class="text-secondary"><i class="fa fa-check" aria-hidden="true"></i></label> </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-md-8 text-left"><label class="text-secondary"><i class="fa fa-times" aria-hidden="true"></i></label> </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty images}">
                <hr class="style-seven"/>
                <c:forEach items="${images}" var="item">
                    <div class="row" style="padding-bottom: 20px">
                        <div class="col-12">
                            <div class="mainPhoto">
                                <c:choose>
                                    <c:when test="${item eq 'photoPlaceholder'}">
                                        <img  src="../resources/images/photoPlaceholder.jpg" class="d-block img-fluid w-100"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img  src="data:image/jpeg;base64,${item}" class="d-block img-fluid w-100"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
        </c:choose>

        <hr class="style-seven"/>

        <div class="row " style="padding-bottom: 20px">
            <div class="description">
                <div class="col-md-12">
                    <label class="text-secondary">${auction.description}</label>
                </div>
            </div>
        </div>

        <hr class="style-seven"/>

    </div>
</div>

<c:choose>
    <c:when test="${not empty auction.biddingList}">

        <div class="py-5">
            <div class="container bg-primary">
                <div class="row" style="padding-left:30px;padding-right:30px;">
                    <div class="form-group w-100">
                        <h3 style="padding-bottom:10px" class="text-secondary text-center">Licytacja:</h3>
                    </div>
                    <div class="form-group w-100"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table">
                            <thead class="bg-warning text-white">
                            <tr>
                                <th>#</th>
                                <th>Login</th>
                                <th>Ilość</th>
                                <th>Cena</th>
                                <th>Data</th>
                            </tr>
                            </thead>
                            <tbody class="bg-primary text-secondary">
                            <%
                                List<BiddingModel> biddingModelList = (ArrayList<BiddingModel>)session.getAttribute("biddingList");
                                if(biddingModelList != null){
                                    for( int i=0 ; i < biddingModelList.size(); i++){%>
                                        <tr>
                                            <td><% out.print(i+1); %></td>
                                            <td><% out.print(biddingModelList.get(i).getUserLogin()); %></td>
                                            <td><% out.print(biddingModelList.get(i).getItemNumber()); %></td>
                                            <td><% out.print(biddingModelList.get(i).getPrice()); %></td>
                                            <td><% out.print(biddingModelList.get(i).getTmpDate()); %></td>
                                        </tr>
                            <%}}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </c:when>

</c:choose>


<jsp:include page="footer.jsp"></jsp:include>

<script>
    $('#buyNowButton').on('click', function () {

        $.ajax({
            url: "/auction/buy/${auction.id}/${auction.userId}/" + $('#itemNumberInput').val() + "/" + 0.0,
            type: "POST",
            success: function () {
                window.location = "/auction/${auction.id}";
            }
            });
        window.location = "/auction/${auction.id}";

    });

    $('#biddingButton').on('click', function () {

        $.ajax({
            url: "/auction/buy/${auction.id}/${auction.userId}/" + $('#itemNumberInputBidding').val() + "/" + $('#biddingPriceInput').val(),
            type: "POST",
            success: function () {
                window.location = "/auction/${auction.id}";
            }
        });
        window.location = "/auction/${auction.id}";

    });
</script>

</body>
</html>
