<%-- 
    Document   : student
    Created on : 21-Nov-2021, 15:10:00
    Author     : manhq
--%>
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
<%@include file="../dist/inc/menu.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Trainee</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Trainee</li>
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


            <div class="d-flex justify-content-between mb-3">
                <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#modalThem">Add</button>

                <form class="d-flex" action="<%=request.getContextPath()%>/admin/getTraineeBy?view">
                    <div class="form-outline">
                        <input type="search" id="form1" name="id" class="form-control" placeholder="Enter ID..." />
                    </div>
                    <button type="submit"  class="btn btn-primary ml-1">
                        <i class="fas fa-search"></i>
                </form>
            </div>
        </div>


        <table class="table table-bordered" id="datatable">
            <thead class="thead-CCFFFF">
                <tr class="list-header">
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">Trainee Name</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone</th>
                                        <th scope="col">Email</th>
                    <th scope="col">Class</th>

                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (request.getAttribute("sinhvienList") != null) {
                        List<sinhvien> sinhvienList = (List<sinhvien>) request.getAttribute("sinhvienList");
                        if (sinhvienList.size() > 0) {
                            for (sinhvien objSV : sinhvienList) {
                %>
                <tr class="tr-hover">
                    <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
                    <td><%=objSV.getMaSV()%></td>
                    <td><%=objSV.getTenSV()%></td>
                    <td><%=objSV.getDiaChi()%></td>
                    <td><%=objSV.getSdt()%></td>
                    <td><%=objSV.getEmail()%></td>
                    
                    <td><%=objSV.getLop().getTenLop()%></td>
                    <td>
                        <button type="button" class="btn btn-warning suaMenu">
                            <a class="text-dark" href="<%=request.getContextPath()%>/admin/getTraineeBy?id=<%=objSV.getMaSV()%>">Edit</a>
                        </button>                          
                        <button xoaMenu="" type="button" class="btn btn-danger">
                            <a class="text-dark" onclick="showMess(<%=objSV.getMaSV()%>)" href="#">Delete</a>
                        </button>
                    </td>
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
<!-- /.content -->
<!-- Modal -->
<div class="modal fade" id="modalThem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add New Trainee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action ="<%=request.getContextPath()%>/admin/trainee?add" method="post">

                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">ID</label>
                        <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="masv">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Trainee Name</label>
                        <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="tensv">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Address</label>
                        <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="diachi">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Phone</label>
                        <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="sdt">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Email</label>
                        <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="email">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Class</label>
                        <%
                            if (request.getAttribute("lopList") != null) {
                                List<Lop> lopList = (List<Lop>) request.getAttribute("lopList");
                                if (lopList.size() > 0) {
                        %>
                        <select class="form-control" id="exampleFormControlSelect1" name="malop">
                            <%
                                for (Lop objLop : lopList) {
                            %>
                            <option value="<%=objLop.getMaLop()%>"><%=objLop.getTenLop()%></option>
                            <%
                                }
                            %>
                        </select>
                        <%
                                }
                            }
                        %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Exit</button>
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>        
                </form>
            </div>
        </div>
    </div>
</div>

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
<script>
    function showMess(id){
    var option = confirm("Are you sure to DELETE?")
    if (option === true) {
        window.location.href = '<%=request.getContextPath()%>/admin/trainee/delete?id=' + id;
        }
    }
</script>
<!-- /.content-wrapper -->
<%@include file="../dist/inc/footer.jsp" %>
