<%-- 
    Document   : index
    Created on : 16-Nov-2021, 15:47:50
    Author     : manhq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
<!--    <c:if test="${not empty sessionScope['username']}">
        <c:redirect url="course.jsp"/>
    </c:if>-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign In </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <!-- Font Icon -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> 
    <link rel="stylesheet" href="../dist/css/sign.css"/>
</head>
<body>
    <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
        <div class="card card0 border-0">
            <div class="row d-flex">
                <div class="col-lg-6">
                    <div class="card1 pb-5">
                        <div class="row"> <img src="../dist/img/logo.png" class="logo"> </div>
                        <div class="row px-3 justify-content-center mt-4 mb-5 border-line"> <img src="../dist/img/signup-image.jpg" class="image"> </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card2 card border-0 px-4 py-5">
                        <div class="row mb-4 px-3">
                            <h6 class="mb-0 mr-4 mt-2">Sign in with</h6>
                            <div class="facebook text-center mr-3">
                                <div class="fab fa-facebook-f"></div>
                            </div>
                            <div class="twitter text-center mr-3">
                                <div class="fab fa-twitter"></div>
                            </div>
                            <div class="linkedin text-center mr-3">
                                <div class="fab fa-linkedin-in"></div>
                            </div>
                        </div>
                        <div class="row px-3 mb-4">
                            <div class="line"></div> <small class="oor text-center">Or</small>
                            <div class="line"></div>
                        </div>
                        <form method="post" action="<%=request.getContextPath()%>/auth/login">
                            <div class="row px-3"> <label class="mb-1">
                                    <h6 class="mb-0 text-sm">User Name</h6>
                                </label> <input class="mb-4" type="text" name="username" placeholder="Enter your UserName"> </div>
                            <div class="row px-3"> <label class="mb-1">
                                    <h6 class="mb-0 text-sm">Password</h6>
                                </label> <input type="password" name="pass" placeholder="Enter your password"> </div>
                            <div class="row px-3 mb-4">
                                <div class="custom-control custom-checkbox custom-control-inline"> <input id="chk1" type="checkbox" name="chk" class="custom-control-input"> <label for="chk1" class="custom-control-label text-sm">Remember me</label> </div> <a href="#" class="ml-auto mb-0 text-sm">Forgot Password?</a>
                            </div>
                            <div class="row mb-3 px-3"> <button type="submit" class="btn btn-blue text-center">Login</button> </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JS -->
    <!-- Library -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
