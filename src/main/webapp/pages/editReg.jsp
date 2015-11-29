<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div style="margin: auto">

		<div style="color: olive; font-size: 30px">
			Edición
		</div>

		<form:form id="editForm" modelAttribute="employeeDTO" method="post" action="update">
			<table style="width:400px; height:150px; margin: auto">
				<tr>
					<td><form:label path="firstName">Nombre</form:label></td>
					<td><form:input path="firstName" value="${employeeObject.firstName}" /></td>
				</tr>
				<tr>
					<td><form:label path="lastName">Apellido</form:label></td>
					<td><form:input path="lastName" value="${employeeObject.lastName}"/></td>
				</tr>
				<tr>
					<td><form:label path="email">Email</form:label></td>
					<td><form:input path="email" value="${employeeObject.email}"/></td>
				</tr>
				<tr>
					<td><form:label path="phone">Teléfono</form:label></td>
					<td><form:input path="phone" value="${employeeObject.phone}"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="id" value="${employeeObject.id}">
						<input type="submit" value="Actualizar" />
					</td>
				</tr>
			</table>
		</form:form>
	</div>
