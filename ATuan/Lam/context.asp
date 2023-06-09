 <!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href=  "style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    </head>
<style>
   .context {
    text-align: center;
    margin-top: 50px;
    border: 1px solid #a5a2a2d1;
    padding: 20px;
    max-width: 1000px;
    margin: 0 auto;
  }
  
  .title {
    border-bottom: 1px solid #ccc;
    margin-bottom: 20px;
    padding-bottom: 10px;
    font-size: 18px;
    font-weight: bold;
  }
  
  .chapter{
    font-size: 24px;
    font-family: inherit;
    margin-bottom: 10px;
  }

  .time{
    font-size: 16px;
    margin-bottom: 10px;
      font-family: "Times New Roman", Times, serif;

  }

  
  .author {
    font-size: 14px;
    color: #888;
  }
  .breadcrumb {
    text-align: left ;
    font-size: 14px;
  }
  
  .breadcrumb a {
    text-decoration: none;
  }
  
  .breadcrumb a:hover {
    text-decoration: underline;
  }
   /* CSS cho phần bình luận */
  #comment-section {    
    border-top: 1px solid #ccc;

    margin-top: 20px;
  }
  #comment-section h2 {
    font-size: 18px;
    margin-bottom: 10px;
  }
  #comment-section form {
    margin-bottom: 10px;
  }
  #comment-section textarea {
    width: 100%;
    height: 100px;
    resize: none;
  }
  #comment-section button {
    padding: 5px 10px;
  }
  #comment-section .comment {
    margin-bottom: 10px;
  }
  #comment-section .comment .author {
    font-weight: bold;
  }
  #comment-section .comment .date {
    font-size: 12px;
    color: gray;
  }
 #comment-section .comment .acts {
    float: right;
    text-align: right;
    font-size: 12px;
    line-height: 20px;
  } 

  .buttons {
    margin-top: 20px;
    
  }
  
  .buttons button {
    padding: 5px 7px;
    background-color: #f1f1f1;
    border: 1px solid #ccc;
    margin-right: 10px;
    cursor: pointer;
}
.dark-mode {
    background-color: #222;
    color: #fff;
}

.dark-mode button {
    background-color: #444;
    color: #fff;
}
#dark-mode-toggle {
    position: fixed;
    bottom: 20px;
    right: 20px;
}
.line-icon-btn {
  font-family: 'Material Symbols Outlined', sans-serif;
  font-size: 24px;
  vertical-align: middle;
}

.line-icon {
  font-size: 48px; 
  fill: currentColor;
}

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 1,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}

</style>
</div>
<body>
<%
   Dim id_chuong
   id_chuong = Request.QueryString("id_chuong")
   
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;"
%>

<%

  ' Lấy id_truyen từ tham số trên URL hoặc từ cơ sở dữ liệu
  Dim id_truyen
  id_truyen = Request.QueryString("id_truyen")

  

%>

  <div class="context">
    <div class="breadcrumb">
    <a href="index.asp">Trang Chủ <a>/
  <%
 If id_truyen <> "" And id_chuong <> "" Then
    Dim strSQLTitle
    strSQLTitle = "SELECT t.ten_truyen, c.ten_chuong, t.id_truyen FROM truyen AS t INNER JOIN chuong AS c ON t.id_truyen = c.id_truyen WHERE t.id_truyen = " & id_truyen & " AND c.id_chuong = " & id_chuong
    
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;"
    
    Set rs = conn.Execute(strSQLTitle)
    
    If Not rs.EOF Then
        Dim ten_truyen
        Dim ten_chuong
        Dim trang_truyen_link

        ten_truyen = rs("ten_truyen")
        ten_chuong = rs("ten_chuong")
        trang_truyen_link = "testTrangTruyen.asp?id_truyen=" & rs("id_truyen")
        

        ' Hiển thị thông tin ten_truyen và ten_chuong
        Response.Write "<a href=""" & trang_truyen_link & """>" & ten_truyen & "</a>/"
        Response.Write " " & ten_chuong
    End If

    rs.Close
    conn.Close
    Set rs = Nothing
    Set conn = Nothing
End If
   %>
   <span id="dark-mode-toggle" class="material-symbols-outlined line-icon-btn" onclick="toggleDarkMode()">dark_mode</span>

<script>
   // Hàm kiểm tra chế độ sáng/tối và cập nhật giao diện
function setTheme() {
    var isDarkMode = localStorage.getItem("darkMode") === "true";
    var body = document.body;
    body.classList.toggle("dark-mode", isDarkMode);
}

// Hàm chuyển đổi chế độ sáng/tối và lưu trạng thái vào localStorage
function toggleDarkMode() {
    var body = document.body;
    var isDarkMode = body.classList.toggle("dark-mode");
    localStorage.setItem("darkMode", isDarkMode);
    var darkModeToggle = document.getElementById("dark-mode-toggle");
    darkModeToggle.textContent = isDarkMode ? "light_mode" : "dark_mode";
}

// Gọi hàm setTheme() khi trang được tải
setTheme();



    </script>


    </div>

    <div class="title">
   <%
If id_truyen <> "" And id_chuong <> "" Then
    Dim strSQLeee
    strSQLeee = "SELECT t.ten_truyen, c.ten_chuong, c.chuong_thoi_gian " & _
             "FROM truyen AS t " & _
             "INNER JOIN chuong AS c ON t.id_truyen = c.id_truyen " & _
             "WHERE t.id_truyen = " & id_truyen & " AND c.id_chuong = " & id_chuong
    
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;"
    
    Set rs = conn.Execute(strSQLeee)
    
    If Not rs.EOF Then
     
        Dim chuong_thoi_gian
        
        ten_truyen = rs("ten_truyen")
        ten_chuong = rs("ten_chuong")
        chuong_thoi_gian = rs("chuong_thoi_gian")
        
        ' Hiển thị thông tin
        Response.Write "<h2>" & ten_truyen & "</h2>"
        Response.Write "<div class='chapter'>" & ten_chuong & "</div>"
        Response.Write "<div class='time'>" & chuong_thoi_gian & "</div>"
    End If
    
    rs.Close
    conn.Close
    Set rs = Nothing
    Set conn = Nothing
End If
%>


   
   <%
If id_truyen <> "" Then
    ' Kiểm tra xem chương đó có phải là chương đầu tiên hay không
    Dim strSQLPrev
    strSQLPrev = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong < " & id_chuong & " ORDER BY id_chuong DESC"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;"

    Set rs = conn.Execute(strSQLPrev)

    If Not rs.EOF Then
        ' Nếu tồn tại chương trước đó, hiển thị nút quay lại chương
%>
    <button class="buttons">   <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"> < Trước </a>  </button>
<%
    End If
End If
%>

    <button>
<a href="testTrangTruyen.asp?id_truyen=<%= id_truyen %>">Mục lục</a></button>
<%
If id_truyen <> "" Then
    ' Kiểm tra xem chương đó có phải là chương cuối cùng hay không
    Dim strSQLNext
    strSQLNext = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong > " & id_chuong & " ORDER BY id_chuong ASC"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;"

    Set rs = conn.Execute(strSQLNext)

    If Not rs.EOF Then
        ' Nếu tồn tại chương tiếp theo, hiển thị nút chuyển chương tiếp
%>
      <button class="buttons">
      <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>">  Sau > </a>    </button>

<%
    End If

  
End If
%>

</div>

   
<%
Dim rs
Set rs = Server.CreateObject("ADODB.Recordset")

Dim strSQL
strSQL = "SELECT * FROM chuong WHERE chuong.id_chuong =" &id_chuong 

rs.Open strSQL, conn



If Not rs.EOF Then
    Do While Not rs.EOF
        Response.Write  (rs("ndung_chuong") & "<br>")
        rs.MoveNext
    Loop
End If


%>


%>
   <div id="comment-section">
   <div class="button">

<%            

If id_truyen <> "" Then
    ' Kiểm tra xem chương đó có phải là chương đầu tiên hay không
    Dim strSQLPrevi
    strSQLPrevi = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong < " & id_chuong & " ORDER BY id_chuong DESC"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;"

    Set rs = conn.Execute(strSQLPrevi)

    If Not rs.EOF Then
        ' Nếu tồn tại chương trước đó, hiển thị nút quay lại chương
%>
    <button>   <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>">Chương Trước</a>  </button>
<%
    End If
End If
%>
 <button>
<a href="testTrangTruyen.asp?id_truyen=<%= id_truyen %>">Mục lục</a></button>
<%
If id_truyen <> "" Then
    ' Kiểm tra xem chương đó có phải là chương cuối cùng hay không
    Dim strSQLNextChapter
    strSQLNextChapter = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong > " & id_chuong & " ORDER BY id_chuong ASC"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;"

    Set rs = conn.Execute(strSQLNextChapter)

    If Not rs.EOF Then
        ' Nếu tồn tại chương tiếp theo, hiển thị nút chuyển chương tiếp
%>
      <button>
      <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"> Chương Sau  </a>    </button>

<%
    End If

  
End If
%>
  </div>
   <div id="comment-section">
 <!-- #include file="ViewComments.asp" -->
</div>
  </div>
  <%
Set rs = Nothing
%>

  </body>
</html>
  