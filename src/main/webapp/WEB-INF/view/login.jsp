<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Logowanie</title>
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
            <h3 class="text-center mt-5 mb-4">Logowanie</h3>
            <c:if test="${param.error != null && not empty SPRING_SECURITY_LAST_EXCEPTION}">
                <div class="alert alert-danger" role="alert">
                    <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                </div>
            </c:if>
            <form:form method="post">
                <div class="form-group">
                    <label for="username">Nick:</label>
                    <input type="text" id="username" name="username" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="password">Hasło:</label>
                    <input type="password" id="password" name="password" class="form-control" />
                </div>
                <button type="submit" class="btn btn-primary btn-block">Zaloguj się</button>
            </form:form>
            <span class="mx-2">lub</span>
            <div class="text-center mt-4">
                <button class="btn btn-primary" onclick="window.location.href='register'">Zarejestruj się</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>