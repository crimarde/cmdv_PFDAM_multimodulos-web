package es.enbinario.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import es.enbinario.negocio.EmployeeDTO;
import es.enbinario.services.DataService;

@Controller
public class DataController {
	
	@Autowired
	private DataService dataService;
	
	protected final Log logger = LogFactory.getLog(getClass());

	@RequestMapping("form")
	public ModelAndView getForm(@ModelAttribute EmployeeDTO employeeDTO) {
		logger.info("Hemos entrado en el metodo DataController.getForm. -- Redireccion a la pagina form");
		
		/* Creamos un map, le introducimos una serie de valores
		 * Creamos un ModelAndView le metemos el map que hemos creado (las variables estrán disponibles en la vista)
		 * Seteamos el nombre de la vista a la que queremos redirigir (tiene que haber un viewResolver configurado)
		 */
		
		Map<String, Object> miModelo = new HashMap<String, Object>();
		miModelo.put("variable", "valor");
		
		// Objetos que estarán disponibles en la vista
        ModelAndView miMAV = new ModelAndView();
        miMAV.setViewName("form");
        miMAV.addObject(miModelo);
        miMAV.addObject(employeeDTO);

        return miMAV;
	}
	
	@RequestMapping("register")
	public ModelAndView registerUser(@ModelAttribute EmployeeDTO employee) {
		dataService.insertRow(employee);
		return new ModelAndView("redirect:list");
	}
	
	@RequestMapping("list")
	public ModelAndView getList() {
		List<EmployeeDTO> employeeList = dataService.getList();
		return new ModelAndView("personList","employeeList",employeeList);
	}
	
	@RequestMapping("delete")
	public ModelAndView deleteUser(@RequestParam long id) {
		dataService.deleteRow(id);
		return new ModelAndView("redirect:list");
	}
	
	@RequestMapping("edit")
	/* No hace falta pasarle todos lo parámetros al método, en este caso con uno de ellos es más que 
	 * suficiente, el objetivo es ver las diferentes posibilidades que ofrece spring.
	 * 
	 * 1. Con @RequestParam -> spring busca en la request el atributo id y genera un long (el cast es automático)
	 * 	Si el nobre no es el mismo pedemos usar una expresión de este tipo @RequestParam("id") long id
	 * 2. @ModelAttribute Employee employee -> convierte los campos de la request en las propiedades de un objeto empleado que construye y te devuelve
	 * 3. ModelMap -> Es un map en el que spring almacena variables, automáticamente se lo hace llegar a la vista con los valores cargados
	 * 	El modelMap es una altenativa al ModelAndView (hacen exactmente lo mismo, es sólo cuestión de nomenclatura)
	 */
	public ModelAndView editUser(@RequestParam long id, @ModelAttribute EmployeeDTO employeeDTO, ModelMap model) {
		EmployeeDTO employeeObject = dataService.getRowById(id);
		EmployeeDTO employeeObject2 = dataService.getRowById(((EmployeeDTO)model.get("employeeDTO")).getId());
		EmployeeDTO employeeObject3 = dataService.getRowById(employeeDTO.getId());
		model.put("employee", employeeObject);
		//return "edit";
		return new ModelAndView("edit","employeeObject",employeeObject);
	}
	
	@RequestMapping("update")
	public ModelAndView updateUser(HttpServletRequest request, @ModelAttribute EmployeeDTO employeeDTO, ModelMap model) {
		dataService.updateRow(employeeDTO);
		
		RedirectView redirectView = new RedirectView();
		//redirectView.setUrl(request.getContextPath() + "/list");
		//redirectView.setUrl("");
		//return redirectView;  //RedirectView lo que hace es ejecutar el metodo con requestparam "edit"
		
		//Alternativa al redirectView
		return new ModelAndView("redirect:list");
	}
	
	@RequestMapping("check")
	public @ResponseBody boolean checkDuplicateInsert(@RequestParam String firstName ,@RequestParam String lastName, @RequestParam String email, @RequestParam String phone){
//	public @ResponseBody boolean checkDuplicateInsert(@ModelAttribute Employee employee){
		return dataService.checkDuplicateInsert(new EmployeeDTO(firstName, lastName, email, phone));
		//return dataService.checkDuplicateInsert(employe);
		//return true;
	}

	@RequestMapping("index")
	public ModelAndView pruebaIndex(HttpServletRequest request) {
		ModelAndView miMAV = new ModelAndView();
        //miMAV.setViewName("DefaultTemplate");
        miMAV.setViewName("index");
        return miMAV;
	}
	
	@RequestMapping("viewList")
	public ModelAndView pruebaList(HttpServletRequest request) {
//		ModelAndView miMAV = new ModelAndView();
//		List<EmployeeDTO> employeeList = dataService.getList();
//		miMAV.addObject(employeeList);
//        miMAV.setViewName("personList");
//        return miMAV;
		
		List<EmployeeDTO> employeeList = dataService.getList();
		
		ModelAndView miMAV = new ModelAndView();
        miMAV.setViewName("personList");
        miMAV.addObject(new EmployeeDTO());
        miMAV.addObject("employeeList", employeeList);

        return miMAV;
		
		
		//List<EmployeeDTO> employeeList = dataService.getList();
		//return new ModelAndView("personList","employeeList",employeeList);
	}
	
}
