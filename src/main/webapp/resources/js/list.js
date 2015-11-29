/*
 * Archivo de confcuración de javascript
 */

function redirige(id,nombre,ape,email,tel){
	alert("El nombre es: " + nombre);
	window.location = 'edit?id='+id+'&firstName='+nombre+'&lastName='+ape+'&email='+email+'&phone='+tel;
}

function eliminar(id){
	window.location = 'delete?id='+id;
}

function addEntry(){
	window.location = 'form';
}

function formReset(event) {
	var obj = $('input:valid');
	$.each(obj,function(){
		if($(this).val() != 'Actualizar'){
			$(this).val('');
		}
	});
}