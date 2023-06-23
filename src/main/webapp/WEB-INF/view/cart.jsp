<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Koszyk</title>
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
<div class="container">

    <h2 class="text-center mt-5 mb-4">Koszyk:</h2>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nazwa</th>
            <th>Wydawnictwo</th>
            <th>Cena</th>
            <th>Kategoria</th>
            <th>Autorzy</th>
            <th>Akcje</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${books}">
            <tr>
                <td><c:out value="${book.nazwa}" /></td>
                <td><c:out value="${book.wydawnictwo}" /></td>
                <td><c:out value="${book.cena}" /></td>
                <td><c:out value="${book.kategoria.nazwa}" /></td>
                <td class="author-cell">
                    <c:forEach var="autor" items="${book.autorzy}">
                        ${autor.imie} ${autor.nazwisko} <br />
                    </c:forEach>
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/cart/delete" method="post">
                        <input type="hidden" name="bookId" value="${book.id}"/>
                        <button type="submit" class="btn btn-secondary">Usuń</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <button class="btn btn-primary" onclick="window.location.href='books/list'">
        Wróć
    </button>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>