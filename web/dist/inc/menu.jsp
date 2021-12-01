<%-- 
    Document   : menu
    Created on : 21-Nov-2021, 14:01:10
    Author     : manhq
--%>

<%@page import="models.taikhoan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<%=request.getContextPath()%>/admin" class="brand-link">
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
                <a href="#" class="d-block"><%=objTK.getUsername()%></a>
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
                    <a href="<%=request.getContextPath()%>/admin/home" class="nav-link active">
                        <i class="fa fa-house-damage"></i>
                        <p>
                            Home
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/admin/trainee" class="nav-link">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Trainee
                            <span class="right badge badge-danger">New</span>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/admin/trainer" class="nav-link">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Trainer
                            <span class="right badge badge-danger">New</span>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-copy"></i>
                        <p>
                            General Information
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/admin/class" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Class</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/admin/topic" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Topic</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/admin/category" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Category</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-chart-pie"></i>
                        <p>
                             Detailed information
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/admin/workplan" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Work Plan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/admin/classtopic" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Class Topic</p>
                            </a>
                        </li>
                        
                    </ul>
                </li>               

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-table"></i>
                        <p>
                            User
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/admin/account" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Account</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/admin/role" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Role</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/logout" class="nav-link">
                        <i class="nav-icon fa fa-sign-out-alt"></i>
                        <p>
                            Log Out
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>