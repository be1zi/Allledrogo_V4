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
                    <li class="list-group-item bg-warning text-white"><i class="fa fa-fw fa-shopping-basket"></i>&nbsp;&nbsp;Zakupy </li>
                    <li class="list-group-item list-group-item-action text-secondary">Kupione</li>
                    <li class="list-group-item list-group-item-action text-secondary">Licytowane</li>
                    <li class="list-group-item list-group-item-action text-secondary">Obserwowane</li>
                    <li class="list-group-item list-group-item-action text-secondary">Niekupione</li>
                </ul>
            </div>
            <div class="col-md-7"></div>
            <div class="col-md-1"></div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script src="webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>