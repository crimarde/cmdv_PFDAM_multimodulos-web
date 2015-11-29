<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div style="margin: auto; text-align: center;">
		<div style="color: olive; font-size: 30px">
			Formulario de alta
		</div>

		<c:url var="userRegistration" value="saveUser.html" />
		<form:form id="registerForm" modelAttribute="employeeDTO" method="post" action="register">
			<table style="width: 400px; height: 150px; margin: auto">
				<tr>
					<td><form:label path="firstName">Nombre</form:label></td>
					<td><form:input path="firstName" /></td>
				</tr>
				<tr>
					<td><form:label path="lastName">Apellido</form:label></td>
					<td><form:input path="lastName" /></td>
				</tr>
				<tr>
					<td><form:label path="email">Email</form:label></td>
					<td><form:input path="email" /></td>
				</tr>
				<tr>
					<td><form:label path="phone">Telefono</form:label></td>
					<td><form:input path="phone" /></td>
				</tr>
				<tr>
					<td colspan="2" >
						<div class="btn-group" role="group" aria-label="MyLabel">
					    	<input type="submit" value="Registrar" class="btn btn-default" />
					    	<input type="reset" value="Vaciar" class="btn btn-default" />
					    </div>
					</td>
				</tr>
			</table>
		</form:form>

		<a href="list">Pulsa aquí para ver la lista completa de contactos</a>
	</div>
