<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="list" scope="request" type="java.util.List"/>
<jsp:useBean id="title" scope="request" type="java.lang.String"/>
<jsp:useBean id="userLogin" scope="request" type="java.lang.String"/>
<%@taglib prefix="singleMessageForm" uri="http://www.springframework.org/tags/form" %>

<div class="photos">
    <div class="row" style="padding-left:30px;padding-right:30px; padding-bottom:20px">
        <div class="form-group w-100">
            <h3 style="padding-bottom:10px" class="text-secondary text-center">${title}</h3>
        </div>
        <div class="form-group w-100"></div>
    </div>
</div>

<c:forEach items="${list}" var="item">

    <c:choose>
        <c:when test="${item.authorLogin eq userLogin}">
            <div class="row p-3 text-secondary">
                <div class="col-md-4"></div>
                <div class="col-md-8 ">
                    <div class="row justify-content-end">
                        <div class="singleMessageDate">
                            <h5 class=""> ${item.tmpDate} </h5>
                        </div>
                    </div>
                    <div class="row text-white justify-content-end">
                        <div class="singleMessage">
                            <h4 class="p-1 border border-success bg-success"> ${item.content} </h4>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="row p-3 text-secondary">
                <div class="col-md-8">
                    <div class="row">
                        <div class="singleMessageDate">
                            <h5> ${item.tmpDate} </h5>
                        </div>
                    </div>
                    <div class="row text-white">
                        <div class="singleMessage">
                            <h4 class="border border-success p-1 bg-success"> ${item.content} </h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
        </c:otherwise>
    </c:choose>

</c:forEach>

<singleMessageForm:form modelAttribute="singleMessage" action="sendReply" method="post">

<div class="row" style="padding-bottom: 50px">
    <div class="col-md-12">
        <div class="form-group">
            <singleMessageForm:textarea path="content" type="text" rows="10"  class="form-control" placeholder="Wiadomość..." required="" ></singleMessageForm:textarea>
        </div>
    </div>
</div>

<div class="row" style="padding-bottom: 50px">
    <div class="col-md-12">
        <div class="editButton px-4">
            <button id="reply" type="submit" class="btn btn-warning btn-block text-center p-2 text-white">Odpowiedz</button>
        </div>
    </div>
</div>

</singleMessageForm:form>
