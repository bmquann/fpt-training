<%-- 
    Document   : student
    Created on : 21-Nov-2021, 15:10:00
    Author     : manhq
--%>
<%@page import="models.Class_Topic"%>
<%@page import="models.Lop"%>
<%@page import="models.sinhvien"%>
<%@page import="models.Category"%>
<%@page import="models.Trainer"%>
<%@page import="models.Topic"%>
<%@page import="models.roles"%>
<%@page import="models.taikhoan"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../dist/inc/header.jsp" %>

<!-- Main Sidebar Container -->
<%@include file="../dist/inc/TrainerMenu.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div  class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 ">Trainer Information</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Trainer</a></li>
                        <li class="breadcrumb-item active">Information</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <%          if (!"".equals(request.getParameter("msg"))) {
                    String msg = request.getParameter("msg");
                    if ("OK".equals(msg)) {
            %>
            <div class="alert alert-success" role="alert">
                Xử lý thành công..!
            </div>
            <%
                    }
                }
            %>
            <%
                if (!"".equals(request.getParameter("msg"))) {
                    String msg = request.getParameter("msg");
                    if ("ERROR".equals(msg)) {
            %>
            <div class="alert alert-success" role="alert">
                Xử lý thất bại..!
            </div>
            <%
                    }
                }
            %>
            <table class="table table-bordered" id="datatable">
                <thead class="thead-CCFFFF">
                    <tr class="list-header">
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Address</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">Email</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        if (request.getAttribute("trainerInfo") != null) {
                            List<Trainer> trainerList = (List<Trainer>) request.getAttribute("trainerInfo");
                            if (trainerList.size() > 0) {
                                for (Trainer objT : trainerList) {
                    %>               
                    <tr class="tr-hover">

                        <td><%=objT.getMaGV()%></td>
                        <td><%=objT.getTenGV()%></td>
                        <td><%=objT.getDiaChi()%></td>
                        <td><%=objT.getSdt()%></td>
                        <td><%=objT.getEmail()%></td>
                       <                   
                    </tr>
                    <%
                                }
                            }
                        }
                    %>
                </tbody>
            </table>
        </div><!-- /.container-fluid -->
    </section>
</div>

<script type="text/javascript">
    $(document).ready(function() {
    $("form").submit(function(event) {
    event.preventDefault();
            var formData = new FormData(this);
            $.ajax({
            url: "input",
                    type: "post",
                    data: formData,
                    success: function(data) {
                    var row = data;
                            for (i = 0; i < row.length; i++) {
                    var column = row[i];
                            var eachrow = "<tr>";
                            for (j = 0; j < column.lenght; j++) {
                    eachrow = eachrow + "<td>" + column[j] + "</td>";
                    }
                    eachrow = eachrow + "</td>";
                            $('#tbody').append(eachrow);
                    }
                    },
                    cache: false,
                    contentType: false,
                    processData: false
            })
    })
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>

            $('#newpass, #confirm').on('keyup', function() {
    if ($('#newpass').val() == $('#confirm').val()) {
    $('#message').html('Matching').css('color', 'green');
    } else
            $('#message').html('Not Matching').css('color', 'red');
    });</script>
<script>
            function showMess(id){
            var option = confirm("Are you sure to DELETE?")
                    if (option === true) {
            window.location.href = '<%=request.getContextPath()%>/student/delete?id=' + id;
            }
            }
</script>
<!-- /.content-wrapper -->
<%@include file="../dist/inc/footer.jsp" %>
