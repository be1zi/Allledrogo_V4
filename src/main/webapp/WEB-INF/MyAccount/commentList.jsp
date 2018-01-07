<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/CSS/rating.css">

<jsp:useBean id="list" scope="request" type="java.util.List"/>

<c:choose>
    <c:when test="${empty list}">
        <div class="container">
            <img class="d-block img-fluid w-100" src="../resources/images/emptyListPlaceholder.jpg" atl="first slide">
        </div>
    </c:when>
</c:choose>

<c:forEach items="${list}" var="item">

<div class="commentElement" style="border: solid red; border-radius: 30px; border: 5px solid; margin-bottom:20px">
    <div class="row text-secondary p-3">
        <div class="col-md-5">
            <div class="clientType">
                <h2>Od: ${item.senderLogin}</h2>
            </div>
        </div>
        <div class="col-md-7 text-center">
            <div class="commentType">
                <h2>${item.tmpDate}</h2>
            </div>
        </div>
    </div>

    <div class="row text-secondary p-3">
        <div class="col-md-12">
            <div class="clientType">
                <h2>Tytuł: ${item.auctionTitle}</h2>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="commentDescription m-3 text-secondary border border-success">
                <h3 class="p-2">${item.description}</h3>
            </div>
        </div>
    </div>
    <div class="row p-3" style="padding-bottom: 25px">
        <div class="col-md-4">
            <div id="hearts" class="starrr" style="padding-left: 5px">
                <c:forEach var="i" begin="0" end="4">
                    <c:choose>
                        <c:when test="${i < item.rate}">
                            <span class="fa fa-star checked" style="font-size: 25px"></span>
                        </c:when>
                        <c:otherwise>
                            <span class="fa fa-star" style="font-size: 25px"></span>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-2 text-secondary">
            <h3>${item.rate}/5</h3>
        </div>
    </div>
</div>

</c:forEach>

