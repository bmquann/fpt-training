<%-- 
    Document   : TrainHeader
    Created on : 25-Nov-2021, 00:56:07
    Author     : manhq
--%>

<%@page import="models.taikhoan"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <a href="#" class="brand-link">
        <img src="<%=request.getContextPath()%>/dist/img/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="display-5 brand-text font-weight-bold ">FPT Training System</span>
    </a>
    <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
            aria-expanded="false" aria-label="Toggle navigation"></button>
    <div class="collapse navbar-collapse ml-5" id="collapsibleNavId">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/trainee">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a data-toggle="modal" data-target="#newPass" class="nav-link" href="<%=request.getContextPath()%>/trainee/changepassword">Change Password</a>
            </li>

        </ul>
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
            <a href="<%=request.getContextPath()%>/logout" class="btn btn-danger ml-3">
                <i class="nav-icon fa fa-sign-out-alt"></i>
                <span>
                    Log Out
                </span>
            </a>
        </div>

    </div>
</nav>
<div class="modal fade" id="newPass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        <input type="password" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="password">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">New PassWord</label>
                        <input type="password" class="form-control-file col-sm-8" id="newpass" name="newpass">
                    </div>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1" class="col-sm-3">Re-Enter New PassWord</label>
                        <input type="password" class="form-control-file col-sm-8" id="confirm" name="newpass1">
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
                