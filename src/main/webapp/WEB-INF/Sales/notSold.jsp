<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--<form >--%>
    <%--<div class="row" id="imageRow">--%>
        <%--<div class="col-md-3">--%>
            <%--<div class="form-group">--%>
                <%--<div class="input-group">--%>
                    <%--<span class="input-group-btn">--%>
                        <%--<span class="btn btn-warning text-white btn-file">--%>
                            <%--Wybierz...--%>
                            <%--<input type="file" name="itemImage" accept="image/png, image/jpeg, image/gif" id="imgInp1">--%>
                            <%--&lt;%&ndash;<auctionForm:input path="file" type="file" name="itemImage" class="form-control" id="usr" />&ndash;%&gt;--%>
                        <%--</span>--%>
                    <%--</span>--%>
                    <%--<input id='urlname'type="text" class="form-control" readonly>--%>
                <%--</div>--%>
                <%--<div id="auctionImages">--%>
                    <%--<img id='img-upload' name="imageSingleAuction"/>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

    <%--</div>--%>
<%--</form>--%>

<form id="upload-file-form" action="/sale/updateFiles" >
    <label for="upload-file-input">Upload your file:</label>
    <input id="upload-file-input" type="file" name="uploadfile" accept="*" />
    <button id="imageChangeButton" type="submit">  Zaladuj </button>
</form>