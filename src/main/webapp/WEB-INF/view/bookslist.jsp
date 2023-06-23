<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Lista książek</title>
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
    <h2>Książki:</h2>

    <div>
        <table class="table mt-4">
            <thead class="thead-light">
            <tr>
                <th scope="col">Tytuł</th>
                <th scope="col">Wydawca</th>
                <th scope="col">Cena</th>
                <th scope="col">Kategoria</th>
                <th scope="col">Autor</th>
                <sec:authorize access="hasRole('USER')">
                    <th scope="col">Działania</th>
                </sec:authorize>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.nazwa}</td>
                    <td>${book.wydawnictwo}</td>
                    <td>${book.cena}</td>
                    <td>${book.kategoria.nazwa}</td>
                    <td>
                        <c:forEach var="author" items="${book.autorzy}">
                            ${author.imie} ${author.nazwisko} <br />
                        </c:forEach>
                    </td>
                    <sec:authorize access="hasRole('USER')">
                        <td>
                            <form action="${pageContext.request.contextPath}/cart/add" method="post">
                                <input type="hidden" name="bookId" value="${book.id}" />
                                <button class="btn btn-sm btn-primary" type="submit" >Dodaj do koszyka</button>
                            </form>
                        </td>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ADMIN')">
                        <td>
                            <a class="btn btn-warning" href="${pageContext.request.contextPath}/books/updateBookForm?bookId=${book.id}">Edytuj</a>
                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/books/deleteBook?bookId=${book.id}">Usuń</a>
                        </td>
                    </sec:authorize>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <sec:authorize access="hasRole('ADMIN')">
    <div>
        <button class="btn btn-primary" onclick="window.location.href='formadd2'; return false;">Dodaj książkę</button>
    </div>
    </sec:authorize>

    <div class="mt-4">
        <a class="btn btn-danger" href="${pageContext.request.contextPath}/logout">Wyloguj</a>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>