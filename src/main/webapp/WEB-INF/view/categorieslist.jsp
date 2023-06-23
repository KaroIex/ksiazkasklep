<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang='pl'>
<head>
    <title>Lista kategorii</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Kategorie:</h2>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nazwa</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="kategoria" items="${kategorie}">
                <tr>
                    <td>${kategoria.id}</td>
                    <td>${kategoria.nazwa}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <button class="btn btn-primary" onclick="window.location.href='add'; return false;">Dodaj kategorię</button>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>