<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Lista Autorów</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <a class="navbar-brand" href="#">
        Bookstore
    </a>
    <form class="form-inline" action="${pageContext.request.contextPath}/logout" method="post">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Wyloguj się</button>
    </form>
</nav>
<div class="container mt-4">
    <h2>Autorzy:</h2>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Imię</th>
            <th scope="col">Nazwisko</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="autor" items="${autorzy}">
            <tr>
                <td>${autor.imie}</td>
                <td>${autor.nazwisko}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <sec:authorize access="hasRole('ADMIN')">
        <button class="btn btn-primary" onclick="window.location.href='authorformadd'">
            Dodaj autora
        </button>
    </sec:authorize>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>