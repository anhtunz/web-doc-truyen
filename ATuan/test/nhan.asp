<!-- #include file="gui.asp" -->
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<style>
.center{
    margin: auto;
   display: flex;
   justify-content: center;
   
}
</style>

<body>



<%
Dim values
values = Split(Request.QueryString("values"), ",")

' Kiểm tra nếu có giá trị values truyền vào
If UBound(values) >= 0 Then
    ' Xử lý giá trị values
    For i = 0 To UBound(values)
        value = values(i)
        ' Thực hiện xử lý dữ liệu theo yêu cầu của bạn

        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
        sql = "SELECT * FROM truyen WHERE id_truyen = " & value
        Set rs = conn.Execute(sql)

        %>
        <div class="card text-dark bg-light mb-3 center" style="max-width: 18rem;">
            <div class="card-header">Bạn đang đọc dở</div>
            <div class="card-body">
                <h5 class="card-title"><%=rs("ten_truyen")%></h5>
                <p class="card-text">Chương 1: Sâu Trong Rừng Rậm 1</p>
            </div>
        </div>
        <%
        rs.Close
        Set rs = Nothing

        conn.Close
        Set conn = Nothing
    Next
Else
    ' Hiển thị thông báo khi không có giá trị values truyền vào
    Response.Write "Bạn chưa đọc truyện nào"
End If
%>


    
    

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>

</html>