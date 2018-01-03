<%@ page import="com.belzowski.Model.UserModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="list" scope="request" type="java.util.List"/>

<c:choose>
    <c:when test="${empty list}">
        <div class="container">
            <img class="d-block img-fluid w-100" src="../resources/images/emptyListPlaceholder.jpg" atl="first slide">
        </div>
    </c:when>
</c:choose>

<c:forEach items="${list}" var="item">

<div class="singleAuction" style="border: solid red; border-radius: 30px; border: 5px solid;">
    <div class="text-white bg-primary py-2">
        <div class="container">

                    <div class="row">
                        <div class="align-self-center p-5 col-md-6">
                            <h5 class="auctionItem text-left text-secondary p-2">Data zakończenia: <c:out value="${item.tmpDate}"/></h5>
                            <h5 class="auctionItem text-left text-secondary p-2">Ilosc sztuk: <c:out value="${item.itemNumber}"/></h5>
                            <c:choose>
                                <c:when test="${ not empty item.biddingPrice}">
                                    <h5 class="auctionItem text-left text-secondary p-2">Cena licytacji: <c:out value="${item.biddingPrice}"/> zł</h5>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${ not empty item.buyNowPrice}">
                                    <h5 class="auctionItem text-left text-secondary p-2">Cena Kup Teraz: <c:out value="${item.buyNowPrice}"/> zł</h5>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${not empty item.biddingPrice}">
                                    <h5 class="auctionItem text-left text-secondary p-2">Liczba licytujących: ${fn:length(item.biddingList)}</h5>
                                </c:when>
                            </c:choose>
                            <h5 class="auctionItem text-left text-secondary p-2">Liczba obserwujących: ${fn:length(item.usersList)}</h5>
                            <h5 class="auctionItem text-left text-secondary p-2">Liczba wyświetleń: <c:out value="${item.viewNumber}"/></h5>

                            <div class="auctionDetails">
                                <div class="row">
                                    <div class="col-md-8">
                                        <h5 class="auctionItem text-secondary text-left p-2">Szczegóły: </h5>
                                    </div>
                                    <dic class="col-md-4">
                                        <a href="/auction/${item.id}" class="btn btn-warning btn-block text-center p-2 text-white">Wyświetl </a>
                                    </dic>
                                </div>
                            </div>

                            <div class="auctionDetails">
                                <div class="row">
                                    <div class="col-md-8">
                                        <h5 class="auctionItem text-secondary text-left p-2">Usuń aukcję: </h5>
                                    </div>
                                    <div class="col-md-4">
                                        <a href="/auction/delete/${item.id}/${item.userId}" class="btn btn-warning btn-block text-center p-2 text-white">Usuń </a>
                                        <%--<button type="button" id="delete" class="btn btn-warning p-2 text-white text-center btn-block" data-toggle="modal" data-target="#deleteAuctionModal">Usuń</button>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 p-0 align-content-center">
                            <div id="carousel1" class="carousel slide align-content-center" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <c:choose>
                                            <c:when test="${item.mainImage eq 'photoPlaceholder'}">
                                                <img class="d-block img-fluid w-100" src="../resources/images/photoPlaceholder.jpg" atl="first slide">
                                            </c:when>
                                            <c:otherwise>
                                                <img class="d-block img-fluid w-100" src="data:image/jpeg;base64,${item.mainImage}" atl="first slide">
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="carousel-caption">
                                            <h3 class="text-secondary bg-primary p-2"><c:out value="${item.title}"/></h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
    </div>
</div>
</c:forEach>

