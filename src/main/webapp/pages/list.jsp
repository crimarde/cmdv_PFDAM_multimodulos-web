<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="text-align: center; margin: auto;">

	<div style="color: teal; font-size: 30px">Listado de contactos</div>

	<!-- employeeList es una lista que el controlador se encarga de cargarlo en el modelo de la vista -->
	<!-- alternativa: la que más me gusta se basa en tener un controlador con scope request y un dto con 
		scope view anotado con component, que se inyecta al controlador para que lo actualice con cada petición 
		que se realice al ccontrolador -->
	<c:if test="${!empty employeeList}">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<table class="table table-striped table-hover">
						<thead>
							<tr class="success">
								<th colspan="6">Listado de contactos</th>
							</tr>
						</thead>

						<tbody>
							<tr class="active">

								<td>Nombre</td>
								<td>Apellido</td>
								<td>Email</td>
								<td>Teléfono</td>
								<td colspan="2">Operaciones</td>
							</tr>
							<c:forEach items="${employeeList}" var="emleaado">
								<tr class="active">

									<td><c:out value="${emleaado.firstName}" /></td>
									<td><c:out value="${emleaado.lastName}" /></td>
									<td><c:out value="${emleaado.email}" /></td>
									<td><c:out value="${emleaado.phone}" /></td>
									<td><input id="${emleaado.id}" type="button" value="Editar"
										class="btn btn-primary btn-xs"
										onclick="redirige(${emleaado.id},'${emleaado.firstName}','${emleaado.lastName}','${emleaado.email}','${emleaado.phone}');">
									</td>
									<td><input id="${emleaado.id}" type="button" value="Eliminar"
										class="btn btn-danger btn-xs" onclick="eliminar(${emleaado.id});">
									</td>
								</tr>
							</c:forEach>
						</tbody>

						<tfoot>
							<tr class="success">
								<td colspan="6">Pie de tabla</td>
							</tr>
						</tfoot>

						<caption>Tabla resumen de usuarios</caption>
					</table>
				</div>
			</div>
		</div>

	</c:if>

	<input id="btnAlta" type="button" value="Añadir un nuevo usuario" onclick="addEntry();"> 
</div>

