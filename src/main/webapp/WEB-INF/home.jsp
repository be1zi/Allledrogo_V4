<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/home.css">
    <link rel="stylesheet" href="../resources/CSS/footer.css">

    <title>ALLLEDROGO</title>
</head>
<body>

    <jsp:include page="header.jsp"></jsp:include>


    <div class="">
        <div class="container-fluid bg-primary p-3">
            <div class="row">
                    <c:forEach items="${list}" var="item">
                        <div class="col-md-4 col-6 p-3">
                            <c:choose>
                                <c:when test="${item.mainImage eq 'photoPlaceholder'}">
                                    <a href="/auction/${item.id}"> <img class="img-fluid" src="../resources/images/photoPlaceholder.jpg"></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/auction/${item.id}"> <img class="d-block img-fluid w-100" src="data:image/jpeg;base64,${item.mainImage}" atl="first slide" href="#"> </a>
                                </c:otherwise>
                            </c:choose>
                            <div class="auctionTitle">
                                <div class="auctionTitleText">
                                    <p class="bg-primary p-2 font-weight-bold">${item.title}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</body>
</html>
