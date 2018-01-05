<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="list" scope="request" type="java.util.List"/>

<c:choose>
    <c:when test="${empty list}">
        <div class="container">
            <img class="d-block img-fluid w-100" src="../resources/images/emptyListPlaceholder.jpg" atl="first slide">
        </div>
    </c:when>
</c:choose>

<c:forEach items="${list}" var="item">
<a href="/myaccount/messages?id=${item.id}">
    <div class="singleMessageListElement" style="border: solid red; border-radius: 30px; border: 5px solid; margin-bottom:20px">
        <div class="row p-3 text-secondary">

            <div class="col-md-2">
                <div class="from">
                    <h2>Od:</h2>
                </div>
            </div>
            <div class="col-md-5">
                <div class="clientName">
                    <h2>${item.senderLogin}</h2>
                </div>
            </div>

            <div class="col-md-5">
                <div class="date">
                    <h2> ${item.tmpDate} </h2>
                </div>
            </div>
        </div>

        <div class="row p-3 text-secondary">
        <div class="col-md-2">
            <div class="from">
                <h2>Do:</h2>
            </div>
        </div>
        <div class="col-md-5">
            <div class="clientName">
                <h2>${item.ownerLogin}</h2>
            </div>
        </div>
        </div>
        <div class="row p-3 text-secondary">
            <div class="col-md-2">
                <div class="topic">
                    <h2>Temat:</h2>
                </div>
            </div>
            <div class="col-md-10">
                <div class="topicDescription">
                    <h2 class="p-2"> ${item.topic} </h2>
                </div>
            </div>
        </div>
        <div class="row p-3 text-secondary">
            <div class="col-md-4">
                <div class="messageNumber">
                    <h2> Ilosc wiadomosci: </h2>
                </div>
            </div>
            <div class="col-md-8">
                <div class="messageNumberNumber">
                    <h2>${item.itemNumber}</h2>
                </div>
            </div>
        </div>
    </div>
</a>
</c:forEach>
