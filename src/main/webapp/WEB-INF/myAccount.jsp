<%@ page import="com.belzowski.Support.Enum.Content" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/details/shopping.css">


    <title>ALLLEDROGO</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="py-5 bg-primary">
    <div class="container-fluid bg-primary p-4">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-3">
                <ul class="list-group">
                    <a class="list-group-item bg-warning text-white"><i class="fa fa-user-o"></i>&nbsp;&nbsp;Moje Konto </a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/myaccount/accountdetails">Dane Konta</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/myaccount/logindetails">Dane Logowania</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/myaccount/addressdetails">Dane Adresowe</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/myaccount/commentlist">Ocena i Komentarze</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/myaccount/messageslist">Wiadomosci</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/myaccount/history">Historia Konta</a>
                </ul>
            </div>
            <div class="col-md-7 border border-success bg-primary " style="padding-top: 25px">

                <% if(session.getAttribute("content") == Content.Login) {%>
                    <jsp:include page="MyAccount/loginDetails.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.Comments){ %>
                    <jsp:include page="MyAccount/commentList.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.History){ %>
                    <jsp:include page="MyAccount/historyList.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.Account) {%>
                    <jsp:include page="MyAccount/accountDetails.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.Account) {%>
                    <jsp:include page="MyAccount/addressDetails.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.Message){ %>
                    <jsp:include page="MyAccount/messageList.jsp"></jsp:include>
                <% } %>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<%--<script src="webjars/jquery/1.11.1/jquery.min.js"></script>--%>
<%--<script src="webjars/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>--%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script src="../resources/Script/myaccount.js"></script>

</body>
</html>
