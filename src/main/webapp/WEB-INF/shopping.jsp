<%@ page import="com.belzowski.Support.Enum.Content" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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

<div class="py-5 bg-primary">
    <div class="container-fluid bg-primary p-4">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-3">
                <ul class="list-group">
                    <li class="list-group-item bg-warning text-white"><i class="fa fa-fw fa-shopping-basket"></i>&nbsp;&nbsp;Zakupy </li>
                    <a class="list-group-item list-group-item-action text-secondary" href="/shopping/bought">Kupione</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/shopping/auctioned">Licytowane</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/shopping/observed">Obserwowane</a>
                </ul>
            </div>
            <div class="col-md-7 border border-success" style="padding-top: 25px; padding-bottom: 25px">
                <% if(session.getAttribute("content") == Content.Bought) {%>
                <jsp:include page="Shopping/bought.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.Auctioned){ %>
                <jsp:include page="Shopping/auctioned.jsp"></jsp:include>
                <% }else if(session.getAttribute("content") == Content.Observed) {%>
                <jsp:include page="Shopping/observed.jsp"></jsp:include>
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

</body>
</html>
