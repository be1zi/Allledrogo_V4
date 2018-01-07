<%@ page import="com.belzowski.Model.AccountModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="user" scope="request" type="java.lang.Object"/>
<jsp:useBean id="account" scope="request" type="java.lang.Object"/>
<jsp:useBean id="auctionNumber" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="positive" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="negative" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="neutral" scope="request" type="java.lang.Integer"/>

<jsp:useBean id="star1" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="star2" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="star3" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="star4" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="star5" scope="request" type="java.lang.Integer"/>

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
    <link rel="stylesheet" href="/resources/CSS/rating.css">

    <title>ALLLEDROGO</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container" style="padding-top: 55px; padding-bottom: 55px">
    <div class="col-md-2"></div>
    <div class="col-md-12 border border-success bg-primary " style="padding-top: 25px">

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">Użytkownik:</h4>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">${user.login}</h4>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">Email:</h4>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">${account.email}</h4>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">Aukcje:</h4>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">${auctionNumber}</h4>
        </div>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-2">
        <div class="input">
            <a href="/userAccount/auctionList" class="btn btn-warning btn-block text-center p-2 text-white">Wyświetl</a>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">Komentarze Pozytywne:</h4>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">${positive}</h4>
        </div>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-2">
        <div class="input">
            <c:choose>
                <c:when test="${positive == 0}">
                    <a href="/myaccount/commentsByType?userType=watcher&type=Positiv" class="btn btn-warning btn-block text-center p-2 text-white" disabled = "true">Wyświetl</a>
                </c:when>
                <c:otherwise>
                    <a href="/myaccount/commentsByType?userType=watcher&type=Positiv" class="btn btn-warning btn-block text-center p-2 text-white">Wyświetl</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 25px">
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">Komentarze Negatywne:</h4>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">${negative}</h4>
        </div>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-2">
        <div class="input">
            <c:choose>
                <c:when test="${negative == 0}">
                    <a href="/myaccount/commentsByType?userType=watcher&type=Negativ" class="btn btn-warning btn-block text-center p-2 text-white" disabled ="disabled">Wyświetl</a>
                </c:when>
                <c:otherwise>
                    <a href="/myaccount/commentsByType?userType=watcher&type=Negativ" class="btn btn-warning btn-block text-center p-2 text-white">Wyświetl</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 40px">
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">Komentarze Neutralne:</h4>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input">
            <h4 class="text-secondary">${neutral}</h4>
        </div>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-2">
        <div class="input">
            <c:choose>
                <c:when test="${neutral == 0}">
                    <a href="/myaccount/commentsByType?userType=watcher&type=Neutral" class="btn btn-warning btn-block text-center p-2 text-white" disabled = "true">Wyświetl</a>
                </c:when>
                <c:otherwise>
                    <a href="/myaccount/commentsByType?userType=watcher&type=Neutral" class="btn btn-warning btn-block text-center p-2 text-white">Wyświetl</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>


<div class = "row px-4" style="padding-bottom: 0px">
    <div class = "col-md-1">
        <div class ="input">
            <h4 class="text-secondary">Ocena</h4>
        </div>
    </div>
    <div class="col-md-4 text-left" style="padding-top: 3px">
        <%
            AccountModel accountModel = (AccountModel)account;
            for(int i=1;i<=5; i++){
                if(i <= accountModel.getMark()){
        %>
        <span class="fa fa-star checked" style="font-size: 25px"></span>
        <%}else{%>
        <span class="fa fa-star" style="font-size: 25px"></span>
        <%}}%>
    </div>
</div>

<div class="row px-4" style="padding-bottom: 0px">
    <div class = "col-md-12">
        <div class = "input">
            <p class="text-secondary">Średnia ocena ${account.mark} na podstawie ${neutral + negative + positive} komentarzy.</p>
        </div>
    </div>
</div>
<div class="row px-4" >
    <div class="col-md-12">
        <div class="input">
            <hr style="border:3px solid #f1f1f1">
        </div>
    </div>
</div>

<div class = "row px-4" style = "padding-bottom: 25px">
    <div class="col-md-12">
        <div class="input">


            <div class="side2">
                <div class="text-secondary">5 gwiazdek</div>
            </div>
            <div class="middle2">
                <div class="bar-container">
                    <c:choose>
                        <c:when test="${(positive + negative + neutral) eq 0}">
                            <div class="bar-5" style="width: 0%"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="bar-5" style="width: ${(star5/(positive+negative+neutral))*100}%"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="side2 right2">
                <div class="text-secondary">${star5}</div>
            </div>


            <div class="side2">
                <div class="text-secondary">4 gwiazdki</div>
            </div>
            <div class="middle2">
                <div class="bar-container">
                    <c:choose>
                        <c:when test="${(positive + negative + neutral) eq 0}">
                            <div class="bar-4" style="width: 0%"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="bar-4" style="width: ${(star4/(positive+negative+neutral))*100}%"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="side2 right2">
                <div class="text-secondary">${star4}</div>
            </div>


            <div class="side2">
                <div class="text-secondary">3 gwiazdki</div>
            </div>
            <div class="middle2">
                <div class="bar-container">
                    <c:choose>
                        <c:when test="${(positive + negative + neutral) eq 0}">
                            <div class="bar-3" style="width: 0%"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="bar-3" style="width: ${(star3/(positive+negative+neutral))*100}%"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="side2 right2">
                <div class="text-secondary">${star3}</div>
            </div>


            <div class="side2">
                <div class="text-secondary">2 gwiazdki</div>
            </div>
            <div class="middle2">
                <div class="bar-container">
                    <c:choose>
                        <c:when test="${(positive + negative + neutral) eq 0}">
                            <div class="bar-2" style="width: 0%"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="bar-2" style="width: ${(star2/(positive+negative+neutral))*100}%"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="side2 right2">
                <div class="text-secondary">${star2}</div>
            </div>


            <div class="side2">
                <div class="text-secondary">1 gwiazdka</div>
            </div>
            <div class="middle2">
                <div class="bar-container">
                    <c:choose>
                        <c:when test="${(positive + negative + neutral) eq 0}">
                            <div class="bar-1" style="width: 0%"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="bar-1" style="width: ${(star1/(positive+negative+neutral))*100}%"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="side2 right2">
                <div class="text-secondary">${star1}</div>
            </div>


        </div>
    </div>
</div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
