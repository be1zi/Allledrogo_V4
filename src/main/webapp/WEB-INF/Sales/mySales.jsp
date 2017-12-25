<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="list" scope="request" type="java.util.List"/>
<c:forEach items="${list}" var="item">

<div class="singleAuction" style="border: solid red; border-radius: 30px; border: 5px solid;">
    <div class="text-white bg-primary py-2">
        <div class="container">


            <%--<jsp:useBean id="list" scope="request" type="java.util.List"/>--%>
            <%--<c:forEach items="${list}" var="item">--%>
                <%--<div class="col-md-12 "  style="padding-bottom: 20px">--%>
                    <%--<div class="box-two proerty-item">--%>

                        <%--<div class="item-entry overflow">--%>
                            <%--<h5><a href="property-1.html" style="padding-left: 15px">--%>
                                <%--<c:out value="${item.firstname} ${item.lastname}"/>--%>
                            <%--</a></h5>--%>
                            <%--<div class="dot-hr"></div>--%>
                            <%--<span class="pull-left" style="padding-left: 15px; padding-bottom: 8px">--%>
                                       <%--<c:out value="${item.email}"/>--%>
                                    <%--</span>--%>
                            <%--<div class="dealer-action pull-right">--%>
                                <%--<a href="/editAccount/${item.userId}" class="button">Edytuj </a>--%>
                                <%--<a href="/deleteAccount/${item.userId}/${item.role}" class="button delete_user_car">Usuń</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</c:forEach>--%>

                    <div class="row">
                        <div class="align-self-center p-5 col-md-6">
                            <h5 class="auctionItem text-left text-secondary p-2">Data zakończenia: <c:out value="${item.tmpDate}"/></h5>
                            <h5 class="auctionItem text-left text-secondary p-2">Ilosc sztuk: <c:out value="${item.itemNumber}"/></h5>
                            <h5 class="auctionItem text-left text-secondary p-2">Cena licytacji: <c:out value="${item.biddingPrice}"/> zł</h5>
                            <h5 class="auctionItem text-left text-secondary p-2">Cena Kup Teraz: <c:out value="${item.buyNowPrice}"/> zł</h5>
                            <h5 class="auctionItem text-left text-secondary p-2">Liczba licytujących: <c:out value="${item.biddingList}"/></h5>
                            <h5 class="auctionItem text-left text-secondary p-2">Liczba obserwujących: <c:out value="${item.usersList}"/></h5>
                            <h5 class="auctionItem text-left text-secondary p-2">Liczba wyświetleń: <c:out value="${item.viewNumber}"/></h5>

                            <div class="auctionDetails">
                                <div class="row">
                                    <div class="col-md-8">
                                        <h5 class="auctionItem text-secondary text-left p-2">Szczególy</h5>
                                    </div>
                                    <dic class="col-md-4">
                                        <a href="/auction/${item.id}" class="btn btn-warning btn-block text-center p-2 text-white">Wyświetl </a>
                                    </dic>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 p-0">
                            <div id="carousel1" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block img-fluid w-100" src="https://pingendo.github.io/templates/sections/assets/gallery_restaurant_1.jpg" atl="first slide">
                                        <div class="carousel-caption">
                                            <h3 class="text-secondary bg-primary p-2"><c:out value="${item.title}"/></h3>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img src="https://pingendo.github.io/templates/sections/assets/gallery_restaurant_2.jpg" class="d-block img-fluid w-100" data-holder-rendered="true">
                                        <div class="carousel-caption">
                                            <h3 class="text-secondary bg-primary p-2"><c:out value="${item.title}"/></h3>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid w-100" src="https://pingendo.github.io/templates/sections/assets/gallery_restaurant_3.jpg" data-holder-rendered="true">
                                        <div class="carousel-caption">
                                            <h3 class="text-secondary bg-primary p-2"><c:out value="${item.title}"/></h3>
                                        </div>
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carousel1" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>
                                <a class="carousel-control-next" href="#carousel1" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
                            </div>
                        </div>
                    </div>


        </div>
    </div>
</div>
</c:forEach>
