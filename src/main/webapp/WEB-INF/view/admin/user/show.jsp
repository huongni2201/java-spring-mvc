<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html>

        <head>
            <title>User Detail</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-5">
                <h2>User Detail</h2>
                <hr />
                <div class="row">
                    <div class="col-7">
                        <ul class="list-group">
                            <li class="list-group-item active" aria-current="true">User information</li>
                            <li class="list-group-item">ID: ${user.id}</li>
                            <li class="list-group-item">Email: ${user.email}</li>
                            <li class="list-group-item">FullName: ${user.fullName}</li>
                            <li class="list-group-item">Address: ${user.address}</li>
                        </ul>
                        <a href="/admin/user" class="btn btn-success mt-3">Back to List</a>
                    </div>
                </div>
            </div>
        </body>

        </html>