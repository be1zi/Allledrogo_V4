<%@ page import="com.belzowski.Support.Enum.Content" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/details/shopping.css">
    <link rel="stylesheet" href="../resources/CSS/Sales/makeAuction.css">

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

                    <a class="list-group-item bg-warning text-white"><i class="fa fa-money"></i>&nbsp;&nbsp;Sprzedaz  </a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/sale/makeauction">Wystaw</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/sale/mysales">Sprzedaje</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/sale/sold">Sprzedane</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/sale/notsold">Niesprzedane</a>

                </ul>
            </div>
            <div class="col-md-7 border border-success" style="padding-top: 25px; padding-bottom: 25px">
                <% if(session.getAttribute("content") == Content.MakeAuction) {%>
                <jsp:include page="Sales/makeAuction.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.MySales){ %>
                <jsp:include page="Sales/mySales.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.Sold){ %>
                <jsp:include page="Sales/sold.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.NotSold) {%>
                <jsp:include page="Sales/notSold.jsp"></jsp:include>
                <% } %>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="../resources/Script/sale.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


</body>
</html>
