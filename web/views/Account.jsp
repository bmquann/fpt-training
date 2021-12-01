<%-- 
    Document   : topic
    Created on : 24-Nov-2021, 14:11:56
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

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Account</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Account</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <%                if (!"".equals(request.getParameter("msg"))) {
                    String msg = request.getParameter("msg");
                    if ("OK".equals(msg)) {
            %>
            <div class="alert alert-success" role="alert">
                Complete..!
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
                Error..!
            </div>
            <%
                    }
                }
            %>
            <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#modalThem">Add</button>
            <table class="table table-bordered" id="datatable">
                <thead class="thead-CCFFFF">
                    <tr class="list-header">
                        <th scope="col">#</th>
                        <th scope="col">id</th>
                        <th scope="col">UserName</th>
                        <th scope="col">PassWord</th>
                        <th scope="col">email</th>
                        <th scope="col" >Role</th>
                        <th scope="col">Action</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        if (request.getAttribute("accList") != null) {
                            List<taikhoan> accList = (List<taikhoan>) request.getAttribute("accList");
                            if (accList.size() > 0) {
                                for (taikhoan objTK : accList) {
                    %>
                    <tr class="tr-hover">
                        <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
                        <td><%=objTK.getId()%></td>
                        <td><%=objTK.getUsername()%></td>
                        <td><%=objTK.getPassword()%></td>
                        <td><%=objTK.getEmail()%></td>
                        
                        <td><%=objTK.getRole().getRole()%></td>
                        <td>

                            <button xoaMenu="" type="button" class="btn btn-danger ">
                                <a class="text-white" onclick="showMess(<%=objTK.getId()%>)" href="#">Delete</a>
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
                    <h5 class="modal-title" id="exampleModalLabel">Add New Account</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action ="<%=request.getContextPath()%>/admin/account" method="post">
                        <div class="form-group row">
                            <label for="exampleFormControlFile1" class="col-sm-3">UserName</label>
                            <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="username">
                        </div>
                        <div class="form-group row">
                            <label for="exampleFormControlFile1" class="col-sm-3">PassWord</label>
                            <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="password">
                        </div>
                        <div class="form-group row">
                            <label for="exampleFormControlFile1" class="col-sm-3">Email</label>
                            <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="email">
                        </div>
                        <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Role</label>
                        <%
                            if (request.getAttribute("roleList") != null) {
                                List<roles> roleList = (List<roles>) request.getAttribute("roleList");
                                if (roleList.size() > 0) {
                        %>
                        <select class="form-control" id="exampleFormControlSelect1" name="roleId">
                            <%
                                for (roles objrole : roleList) {
                            %>
                            <option value="<%=objrole.getId()%>"><%=objrole.getRole()%></option>
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
    $(document).ready(function(){
    $("form").submit(function(event){
    event.preventDefault();
            var formData = new FormData(this);
            $.ajax({
            url:"input",
                    type: "post",
                    data: formData,
                    success: function(data){
                    var row = data;
                            for (i = 0; i < row.length; i++){
                    var column = row[i];
                            var eachrow = "<tr>";
                            for (j = 0; j < column.lenght; j++){
                    eachrow = eachrow + "<td>" + column[j] + "</td>";
                    }
                    eachrow = eachrow + "</td>";
                            $('#tbody').append(eachrow);
                    }
                    },
                    cache:false,
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
        window.location.href = '<%=request.getContextPath()%>/admin/account/delete?id=' + id;
        }
    }
</script>
<!-- /.content-wrapper -->
<%@include file="../dist/inc/footer.jsp" %>

