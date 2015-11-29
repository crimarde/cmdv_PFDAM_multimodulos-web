<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="text-align: center; margin: auto;">

	<div style="color: teal; font-size: 30px">
		Listado de contactos
	</div>

	<c:if test="${!empty employeeList}">
		<table border="1"  class="table table-striped table-hover table-condensed">
			<thead  style="background-color:olive">
				<tr>
					<th colspan="6">
						Listado de contactos
					</th>
				</tr>
			</thead>
			<tbody>
				<tr
					style="background-color: olive; color: white; text-align: center;"
					height="40px">
					
					<td>Nombre</td>
					<td>Apellido</td>
					<td>Email</td>
					<td>Teléfono</td>
					<td colspan="2">Operaciones</td>
				</tr>
				<c:forEach items="${employeeList}" var="user">
					<tr
						style="background-color: white; color: black; text-align: center;"
						height="30px">
						
						<td>
							<c:out value="${user.firstName}" />
						</td>
						<td>
							<c:out value="${user.lastName}" />
						</td>
						<td>
							<c:out value="${user.email}" />
						</td>
						<td>
							<c:out value="${user.phone}" />
						</td>
						<td>
							<input id="${user.id}" type="button" value="Editar" class="btn btn-primary btn-xs" 
								onclick="redirige(${user.id},'${user.firstName}','${user.lastName}','${user.email}','${user.phone}');">
						</td>
						<td>
							<input id="${user.id}"  type="button" value="Eliminar" class="btn btn-danger btn-xs" 
								onclick="eliminar(${user.id});">
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
			<tfoot>
				<tr>
					<td colspan="6">
						Pie de tabla
					</td>
				</tr>
			</tfoot>
			
			<caption>Tabla resumen de usuarios</caption>		
		</table>
	</c:if>
	
	<input id="btnAlta" type="button" value="Añadir un nuevo usuario" onclick="addEntry();">
	<a href="http://localhost:8080/SpringHibernateMaven/form" >Enlace</a>
</div>

