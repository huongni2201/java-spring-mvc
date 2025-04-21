<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Dashboard - Hỏi Dân IT</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">

                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Orders</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row justify-content-center">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h2 class="d-flex justify-content-center mb-5">Input your information</h2>

                                            <form:form method="POST" action="/admin/user/update"
                                                modelAttribute="newUser">
                                                <div class="form-group mb-3" style="display: none;">
                                                    <label for="id" class="form-label">ID:</label>
                                                    <form:input type="text" class="form-control" id="id" path="id"
                                                        placeholder="Enter ID" />
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="email" class="form-label">Email</label>
                                                    <form:input type="email" class="form-control" id="email"
                                                        path="email" placeholder="Enter Email" disabled="true" />
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="fullName" class="form-label">Full Name</label>
                                                    <form:input type="text" class="form-control" id="fullName"
                                                        path="fullName" placeholder="Enter Full Name" />
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="address" class="form-label">Address</label>
                                                    <form:input type="text" class="form-control" id="address"
                                                        path="address" placeholder="Enter Address" />
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="phone" class="form-label">Phone</label>
                                                    <form:input type="tel" class="form-control" id="phone" path="phone"
                                                        placeholder="Enter Phone Number" />
                                                </div>

                                                <button type="submit" class="btn btn-primary w-100">Submit</button>
                                            </form:form>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>


                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>

            </body>

            </html>