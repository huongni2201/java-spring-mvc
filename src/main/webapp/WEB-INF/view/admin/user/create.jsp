<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            </head>

            <body>
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-12 mx-auto">
                            <h2 class="d-flex justify-content-center mb-5">Input your information</h2>

                            <form:form method="post" action="/admin/user/create" modelAttribute="newUser">
                                <div class="form-group mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <form:input type="email" class="form-control" id="email" path="email"
                                        placeholder="Enter Email" />
                                </div>

                                <div class="form-group mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <form:password class="form-control" id="password" path="password"
                                        placeholder="Enter Password" />
                                </div>

                                <div class="form-group mb-3">
                                    <label for="fullName" class="form-label">Full Name</label>
                                    <form:input type="text" class="form-control" id="fullName" path="fullName"
                                        placeholder="Enter Full Name" />
                                </div>

                                <div class="form-group mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <form:input type="text" class="form-control" id="address" path="address"
                                        placeholder="Enter Address" />
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

            </body>

            </html>