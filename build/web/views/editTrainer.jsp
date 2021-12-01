<%-- 
    Document   : editStudent
    Created on : 21-Nov-2021, 17:33:11
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
                    <h1 class="m-0">Trainer</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Trainer</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->

</section>
<!-- /.content -->
<!-- Modal -->
<%        if (request.getAttribute("GVList") != null) {
        List<Trainer> gvList = (List<Trainer>) request.getAttribute("GVList");
        if (gvList.size() > 0) {
            for (Trainer objGV : gvList) {
%>
<div class="card">
    <div class="card-content">
        <div class="card-header">
            <h5 class="card-title" >Update Trainer</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="card-body">
            <form action ="<%=request.getContextPath()%>/admin/trainer/edit?id=<%=objGV.getMaGV()%>" method="post">

                <div class="form-group row">
                    <label for="exampleFormControlFile1" class="col-sm-3">ID</label>
                    <input disabled="" type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="mav" value="<%=objGV.getMaGV()%>">
                </div>
                <div class="form-group row">
                    <label for="exampleFormControlFile1" class="col-sm-3">Name</label>
                    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="tengv" value="<%=objGV.getTenGV()%>">
                </div>
                <div class="form-group row">
                    <label for="exampleFormControlFile1" class="col-sm-3">Address</label>
                    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="diachi" value="<%=objGV.getDiaChi()%>">
                </div>
                <div class="form-group row">
                    <label for="exampleFormControlFile1" class="col-sm-3">Phone Number</label>
                    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="sdt" value="<%=objGV.getSdt()%>" >
                </div>
                <div class="form-group row">
                    <label for="exampleFormControlFile1" class="col-sm-3">Email</label>
                    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="email"value="<%=objGV.getEmail()%>">
                </div>

                
        </div>
        <div class="card-footer text-right">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
                <a class="text-white" href="<%=request.getContextPath()%>/admin/trainer">Exit</a>
            </button>
            <button type="submit" class="btn btn-primary">Update</button>
        </div>        
        </form>

    </div>
</div>
</div>
</div>
<%
        }
    }
}
%>

</div>


<!-- /.content-wrapper -->
<%@include file="../dist/inc/footer.jsp" %>
