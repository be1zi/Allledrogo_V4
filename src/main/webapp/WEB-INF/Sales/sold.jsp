<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <div class="align-self-center p-5 col-md-12">

                        <h3 class="text-secondary bg-primary p-2"><c:out value="${item.getAuctionModel().title}"/></h3>
                        <h5 class="auctionItem text-left text-secondary p-2">Kupujący: <c:out value="${item.userLogin}"/> </h5>
                        <h5 class="auctionItem text-left text-secondary p-2">Data zakupu: <c:out value="${item.tmpDate}"/></h5>
                        <h5 class="auctionItem text-left text-secondary p-2">Ilosc sztuk: <c:out value="${item.itemNumber}"/></h5>
                        <h5 class="auctionItem text-left text-secondary p-2">Cena: <c:out value="${item.price} zł"/></h5>
                        <div class="payInfo">
                            <div class="row">
                                <c:choose>
                                    <c:when test="${item.pay eq false}">
                                        <div class="col-md-8">
                                            <h5 class="auctionItem text-secondary text-left p-2">Status zaplaty: nie zapłacono</h5>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Zmień status</button>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-md-8">
                                            <h5 class="auctionItem text-secondary text-left p-2">Status zaplaty: zapłacono</h5>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                        <div class="auctionDetails">
                            <div class="row">
                                <div class="col-md-8">
                                    <h5 class="auctionItem text-secondary text-left p-2">Szczegóły</h5>
                                </div>
                                <dic class="col-md-4">
                                    <a href="/auction/${item.getAuctionModel().getId()}" class="btn btn-warning btn-block text-center p-2 text-white">Wyświetl </a>
                                </dic>
                            </div>
                        </div>
                        <div class="auctionDetails">
                            <div class="row">
                                <c:choose>
                                    <C:when test="${item.commentSet eq false}">
                                        <div class="col-md-8">
                                            <h5 class="auctionItem text-secondary text-left p-2">Ocena i komentarz: brak</h5>
                                        </div>
                                        <dic class="col-md-4">
                                            <button type="button" class="btn btn-warning btn-block p-2 text-white text-center">Wystaw</button>
                                        </dic>
                                    </C:when>
                                    <c:otherwise>
                                        <div class="col-md-8">
                                            <h5 class="auctionItem text-secondary text-left p-2">Ocena i komentarz: wystawiony</h5>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</c:forEach>