<%-- 
    Document   : menu
    Created on : 21-Nov-2021, 14:01:10
    Author     : manhq
--%>

<%@page import="models.taikhoan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<%=request.getContextPath()%>/trainer" class="brand-link">
        <img src="<%=request.getContextPath()%>/dist/img/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">FPT Training System</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<%=request.getContextPath()%>/dist/img/avatar.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <%
                if (session.getAttribute("userInfor") != null) {
                    taikhoan objTK = (taikhoan) session.getAttribute("userInfor");
            %>
            <div class="info">
                <a data-toggle="modal" data-target="#info" href="#" class="d-block"><%=objTK.getUsername()%></a>
            </div>
            <%
                }
            %>
        </div>

        <!-- SidebarSearch Form -->


        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item menu-open">
                    <a href="<%=request.getContextPath()%>/trainer" class="nav-link active">
                        <i class="fa fa-house-damage nav-icon"></i>
                        <p>
                            Home
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/trainer/trainee" class="nav-link">
                        <i class="fa fa-user-graduate nav-icon"></i>
                        <p>
                            Trainee
                            <span class="right badge badge-danger">New</span>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/trainer/topic" class="nav-link">
                        <i class="fa fa-th nav-icon"></i>
                        <p>
                            Topic
                            <span class="right badge badge-danger">New</span>
                        </p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/trainer/information" class="nav-link">
                        <i class="fa fa-user-graduate nav-icon"></i>
                        <p>
                            Information
                            <span class="right badge badge-danger"></span>
                        </p>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/logout" class="nav-link">
                        <i class="fa fa-sign-out-alt nav-icon"></i>
                        <p>
                            Log Out
                            <span class="right badge badge-danger"></span>
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
<div class="modal fade" id="changepass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="myform" name="input_form" action="<%=request.getContextPath()%>/trainee/changepassword" method="post" >

                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">UserName</label>
                        <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="username">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">PassWord</label>
                        <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="password">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">New PassWord</label>
                        <input type="text" class="form-control-file col-sm-8" id="newpass" name="newpass">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Re-Enter New PassWord</label>
                        <input type="text" class="form-control-file col-sm-8" id="confirm" name="newpass1">
                        <span id='message'></span>
                    </div>                  
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Exit</button>
                        <button onclick="matchpass()" type="submit" class="btn btn-primary">Change</button>
                    </div>        
                </form>

            </div>
        </div>
    </div>
</div>
