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


<div class="p-5 text-center text-white">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="mb-4 text-secondary">${auction.title}</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                    <div class="mainPhoto">
                        <c:choose>
                            <c:when test="${mainImages eq 'photoPlaceholder'}">
                                <img  src="../resources/images/photoPlaceholder.jpg" class="d-block img-fluid w-100"/>
                            </c:when>
                            <c:otherwise>
                                <img  src="data:image/jpeg;base64,${mainImages}" class="d-block img-fluid w-100"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
            </div>
        </div>
    </div>
</div>
<div class="">
    <div class="container">

        <hr class="style-seven"/>

        <div class="row">
            <div class="col-md-6">
                <div class="buyNow">
                    <div class="row p-3">
                        <div class="col-md-4 text-left"> <label class="text-secondary">Data zakończenia:</label> </div>
                        <div class="col-md-8 text-left"> <label class="text-secondary">${auction.tmpDate}</label> </div>
                    </div>
                </div>
                <div class="buyNow">
                    <div class="row p-3">
                        <div class="col-md-4 text-left"> <label class="text-secondary">Dostępne sztuki:</label> </div>
                        <div class="col-md-8 text-left"> <label class="text-secondary">${auction.itemNumber}</label> </div>
                    </div>
                </div>
                <div class="buyNow">
                    <div class="row p-3">
                        <div class="col-md-4 text-left"> <label class="text-secondary">Sprzedający:</label> </div>
                        <div class="col-md-8 text-left"> <label class="text-secondary">TestowySprzedający</label> </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <c:choose>
                    <c:when test="${not empty auction.buyNowPrice}">
                        <div class="buyNow">
                            <div class="row p-3">
                                <div class="col-md-4 text-center"> <label class="text-secondary">${auction.buyNowPrice} zł </label> </div>
                                <div class="col-md-4 text-center">
                                    <c:choose>
                                        <c:when test="${auction.itemNumber == 1}">
                                            <input type="number" class="form-control" placeholder="Ilość sztuk" required="" min="1" max="${auction.itemNumber}" value="1" disabled="true">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="number" class="form-control" placeholder="Ilość sztuk" required="" min="1" max="${auction.itemNumber}" value="1">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-4 text-center">
                                    <button type="button" class="btn btn-warning p-2 text-white text-center btn-block">Kup Teraz</button>
                                </div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${not empty auction.biddingPrice}">
                        <div class="payInfo">
                            <div class="row p-3">
                                <div class="col-md-4">
                                    <input type="number" class="form-control" placeholder="Cena" required="" min="${auction.biddingPrice}" step="0.01" value="${auction.biddingPrice}"> </div>
                                <div class="col-md-4 text-center">
                                    <c:choose>
                                        <c:when test="${auction.itemNumber == 1}">
                                            <input type="number" class="form-control" placeholder="Ilość sztuk" required="" min="1" max="${auction.itemNumber}" value="1" disabled="true">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="number" class="form-control" placeholder="Ilość sztuk" required="" min="1" max="${auction.itemNumber}" value="1">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-4 text-center">
                                    <button type="button" class="btn btn-warning p-2 text-white text-center btn-block">Licytuj</button>
                                </div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>

        <hr class="style-seven"/>

        <div class="row py-3">
            <div class="col-md-6">
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Stan:</label> </div>
                        <div class="col-md-8 text-left"><label class="text-secondary">${auction.state}</label> </div>
                    </div>
                </div>
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Uszkodzony:</label> </div>
                        <c:choose>
                            <c:when test="${auction.damaged eq 'Tak'}">
                                <div class="col-md-8 text-left"><label class="text-secondary"><i class="fa fa-check" aria-hidden="true"></i></label> </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-md-8 text-left"><label class="text-secondary"><i class="fa fa-times" aria-hidden="true"></i></label> </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Kolor:</label> </div>
                        <div class="col-md-8 text-left"><label class="text-secondary">${auction.color}</label> </div>
                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Rok produkcji:</label> </div>
                        <div class="col-md-8 text-left"><label class="text-secondary">${auction.productionDate}</label> </div>
                    </div>
                </div>
                <div class = "parameters">
                    <div class="row px-3 py-1">
                        <div class="col-md-4 text-left"><label class="text-secondary">Gwarancja:</label> </div>
                        <c:choose>
                            <c:when test="${auction.warranty eq 'Tak'}">
                                <div class="col-md-8 text-left"><label class="text-secondary"><i class="fa fa-check" aria-hidden="true"></i></label> </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-md-8 text-left"><label class="text-secondary"><i class="fa fa-times" aria-hidden="true"></i></label> </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty images}">
                <hr class="style-seven"/>
                <c:forEach items="${images}" var="item">
                    <div class="row" style="padding-bottom: 20px">
                        <div class="col-12">
                            <div class="mainPhoto">
                                <c:choose>
                                    <c:when test="${item eq 'photoPlaceholder'}">
                                        <img  src="../resources/images/photoPlaceholder.jpg" class="d-block img-fluid w-100"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img  src="data:image/jpeg;base64,${item}" class="d-block img-fluid w-100"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
        </c:choose>

        <hr class="style-seven"/>

        <div class="row " style="padding-bottom: 20px">
            <div class="description">
                <div class="col-md-12">
                    <label class="text-secondary">${auction.description}</label>
                </div>
            </div>
        </div>

        <hr class="style-seven"/>

    </div>
</div>

<c:choose>
    <c:when test="${ empty auction.biddingList}">
        <div class="py-5">
            <div class="container bg-primary">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table">
                            <thead class="bg-warning text-white">
                            <tr>
                                <th>#</th>
                                <th>Login</th>
                                <th>Cena</th>
                                <th>Data</th>
                            </tr>
                            </thead>
                            <tbody class="bg-primary text-secondary">
                            <tr>
                                <td>1</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>Otto</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>Otto</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>Otto</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </c:when>

</c:choose>


<jsp:include page="footer.jsp"></jsp:include>

<script src="../resources/Script/auction.js"></script>

</body>
</html>
