<%-- 
    Document   : topic
    Created on : 24-Nov-2021, 14:11:56
    Author     : manhq
--%>


<%@page import="models.Topic_Trainer"%>
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
                    <h1 class="m-0">Work Plan</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Work Plan</li>
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
                        <th scope="col">Topic Name</th>
                        <th scope="col">Trainer Name</th>
                        <th scope="col">Trainer Phone Number</th>
                        <th scope="col">Trainer Email</th>
                        <th scope="col">Action</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        if (request.getAttribute("workList") != null) {
                            List<Topic_Trainer> workList = (List<Topic_Trainer>) request.getAttribute("workList");
                            if (workList.size() > 0) {
                                for (Topic_Trainer objW : workList) {
                    %>
                    <tr class="tr-hover">
                        <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>

                        <td><%=objW.getTopic().getName()%></td>
                        <td><%=objW.getTrainer().getTenGV()%></td>
                        <td><%=objW.getTrainer().getSdt()%></td>
                        <td><%=objW.getTrainer().getDiaChi()%></td>
                        <td>

                            <button xoaMenu="" type="button" class="btn btn-danger ">
                                <a class="text-white"  href="<%=request.getContextPath()%>/admin/workplan/delete?trainerid=<%=objW.getTrainer().getMaGV()%>&topicid=<%=objW.getTopic().getId()%>">Delete</a>
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
                    <h5 class="modal-title" id="exampleModalLabel">Add New Trainer To Topic</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action ="<%=request.getContextPath()%>/admin/workplan" method="post">
                         <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Trainer</label>
                        <%
                            if (request.getAttribute("trainerList") != null) {
                                List<Trainer> trainerList = (List<Trainer>) request.getAttribute("trainerList");
                                if (trainerList.size() > 0) {
                        %>
                        <select class="form-control" id="exampleFormControlSelect1" name="maGV">
                            <%
                                for (Trainer objTrainer : trainerList) {
                            %>
                            <option value="<%=objTrainer.getMaGV()%>"><%=objTrainer.getTenGV()%></option>
                            <%
                                }
                            %>
                        </select>
                        <%
                                }
                            }
                        %>
                    </div>
                        <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Topic</label>
                        <%
                            if (request.getAttribute("topicList") != null) {
                                List<Topic> topicList = (List<Topic>) request.getAttribute("topicList");
                                if (topicList.size() > 0) {
                        %>
                        <select class="form-control" id="exampleFormControlSelect1" name="topicID">
                            <%
                                for (Topic objTopic : topicList) {
                            %>
                            <option value="<%=objTopic.getId()%>"><%=objTopic.getName()%></option>
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
<!--<script>
    function showMess(trainerid,topicid){
    var option = confirm("Are you sure to DELETE?")
    if (option === true) {
        window.location.href = ';
    }
</script>-->
<!-- /.content-wrapper -->
<%@include file="../dist/inc/footer.jsp" %>

