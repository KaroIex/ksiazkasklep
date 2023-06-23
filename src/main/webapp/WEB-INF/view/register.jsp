<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Rejestracja</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <a class="navbar-brand" href="#">
        Bookstore
    </a>
</nav>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-5">
            <h3 class="text-center mt-5 mb-4">Rejestracja</h3>
            <c:if test="${not empty validator}">
                <div class="alert alert-danger" role="alert">
                    <c:out value="${validator}"/>
                </div>
            </c:if>
            <form:form method="post" modelAttribute="user">
                <div class="form-group">
                    <label for="username">Nick:</label>
                    <form:input path="username" id="username" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="password">Hasło:</label>
                    <form:password path="password" id="password" class="form-control" />
                </div>
                <button type="submit" class="btn btn-primary btn-block">Zarejestruj się</button>
            </form:form>
            <span class="mx-2">lub</span>
            <div class="text-center mt-4">
                <button class="btn btn-primary" onclick="window.location.href='login'">Zaloguj się</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>