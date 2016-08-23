//MAKE ALL VALIDATION AND PERSONVALIDATION CLASSES/METHODS
package com.hibernate.exercise6.web;

import java.io.IOException;
import java.io.PrintWriter;

import com.hibernate.exercise6.model.Employee;
import com.hibernate.exercise6.service.*;
import com.hibernate.exercise6.dto.*;
import com.hibernate.exercise6.utilities.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.multipart.MultiPartFile;
import org.apache.log4j.Logger;

public class PersonController extends MultiActionController{
	private PersonValidation validation;
	private PersonFileValidation fileValidation;
	private PersonService service;
	
	static Logger log = Logger.getLogger(PersonController.class);
	
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView model = new ModelAndView("index");
		return model;
	}
	
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String sortType = request.getParameter("sort");
		List<EmployeeDTO> personDTOs = service.sortPerson(sortType); //make sortPerson(String sortType) method
		model.addObject("persons", personDTOs);
		return model;
	}
	
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String searchType = request.getParameter("search");
		String searchValue = request.getParameter("searchValue");
		List<EmployeeDTO> personDTOs = sortPerson("sortById");
		String resultMessage = validation.checkSearchValue(searchType, searchValue);
		
		if(resultMessage.equals("Clear")){
			personDTOs = service.searchPerson(searchType, searchValue);
			if(personDTOs == null){
				resultMessage = "No record found";
			}
			else{
				resultMessage = "Showing " + personDTOs.size() + " search result/s";
			}
		}
		ModelAndView model = new ModelAndView("persons");
		model.addObject("resultMessage", resultMessage);
		model.addObject("persons", personDTOs);
		return model;
	}
	
	public void cancel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.sendRedirect("person.htm?action=view");
	} 
	
	public void back(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.sendRedicrect("person.html?action=view");
	}
	
	public ModelAndView editPerson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Long id = Long.parseLong(request.getParameter("personId"));
		List<EmployeeDTO> personDTOs = service.getEmployeeById(id) //make getEmployeeById(long id) method
		Set<RoleDTO> roleNameDTOs = service.getRoleList() //check if you have getRoleNames method
		EmployeeDTO personDTO = null;
		
		for(EmployeeDTO tempPerson : employeeDTOs){
			personDTO = tempPerson;
		}
		
		ModelAndView model = new ModelAndView("personEditor");
		model.addObject("person", personDTO);
		model.addObject("roleNames", roleNameDTOs);
		return model;
	}
	
	public void deletePerson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		recordLog("Deleted 1 Person Record.\n");
		Long id = Long.parseLong(request.getParameter("personId"));
		service.deletePerson(id) //check if you have deletePersonById(long id) method
		response.sendRedirect("person.htm?action=view&OK=02");
	}
	
	public void editContact(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		Long id = Long.parseLong(request.getParameter("personId"));
		List<EmployeeDTO> personDTOs = service.getEmployeeById(id);
		EmployeeDTO personDTO = null;
		
		for(EmployeeDTO tempPerson : personDTOs){
			personDTO = tempPerson;
		}
		ModelAndView model = new ModelAndView("contactEditor");
		model.addObject("person", personDTO);
		return model;
	}
	
	public ModelAndView addPersonRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Long id = Long.parseLong(request.getParameter("personId"));
		List<EmployeeDTO> personDTOs = service.getEmployeeById(id);
		Set<RoleDTO> roleNameDTOs = service.getRoleNames();
		EmployeeDTO personDTO = null;
		
		for(EmployeeDTO tempPerson : personDTOs){
			personDTO = tempPerson;
		}
		ModelAndView model = new ModelAndView("addPersonRole");
		model.addObject("person", personDTO);
		model.addObject("roleNames", roleNameDTOs);
		return model;
	}
	
	public ModelAndView deletePersonRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Long id = Long.parseLong(request.getParameter("personId"));
		List<EmployeeDTO> personDTOs = service.getEmployeeById(id);
		Set<RoleDTO> roleNameDTOs = service.getRoleNames();
		EmployeeDTO personDTO = null;
		
		for(EmployeeDTO tempPerson : personDTOs){
			personDTO = tempPerson;
		}
		ModelAndView model = new ModelAndView("deletePersonRole");
		model.addObject("person", personDTO);
		model.addObject("roleNames", roleNameDTOs);
		return model;
	}
	
	public void savePerson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String resultMessage = validation.checkAddPerson(request, response);
		
		Long id = Long.parseLong(request.getParameter("personId"));
		List<EmployeeDTO> employeeDTOs = service.getEmployeeById(id);
		Set<RoleDTO> roleNameDTOs = service.getRoleNames();
		
		if(resultMessage.equals("Clear")){
			recordLog("Editted 1 Person Record.\n");
			service.saveEdittedPerson(personDTOs, roleNameDTOs); //make saveEdittedPerson(List<EmployeeDTO> personDTOs, List<RoleDTO> roleNameDTO) method
			response.sendRedirect("person.html?action=view&OK=01");
		}
		else{
			EmployeeDTO personDTO = null;
			for(EmployeeDTO tempPerson : personDTOs){
				personDTO = tempPerson;
			}
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/personEditor.jsp");
			request.setAttribute("person", personDTO);
			request.setAttribute("resultMessage", resultMessage);
			request.setAttribute("roleNames", roleNameDTOs);
			rd.forward(request, response);
		}
	}
	
	public void saveContacts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String resultMessage = validation.checkContact(request, response);
		
		if(resultMessage.equals("Clear")){
			recordLog("Editted Contact.\n");
			Long id = Long.parseLong(request.getParameter("personId"));
			List<EmployeeDTO> personDTOs = service.getEmployeeById(id);
			Set<RoleDTO> roleNameDTOs = service.getRoleNames();
			service.saveEdittedContact(personDTOs, roleNameDTOs);
			response.sendRedirect("person.htm?action=view&OK=03");
		}
	}
	
	public void deleteContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		recordLog("Deleted 1 Contact.\n");
		Long personId = Long.parseLong(request.getParameter("personId"));
		Long contactId = Long.parseLong(request.getParameter("contactId"));
		service.deleteContact(personId, contactId);
		response.sendRedirect("person.htm?action=view&OK=07");
	}
	
	public ModelAndView addNewPerson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Set<RoleDTO> roleNameDTOs = service.getRoleNames();
		ModelAndView model = new ModelAndView("add");
		model.addObject("roleNames", roleNameDTOs);
		return model;
	}
	
	public ModelAndView saveNewPerson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String resultMessage = validation.checkAddPerson(request, response);
		Set<RoleDTO> roleNameDTOs = service.getRoleNames();
		if(resultMessage.equals("Clear")){
			recordLog("Added New Person.\n");
			service.saveNewPerson(roleNameDTOs);
			List<EmployeeDTO> personDTOs = service.sortPerson("sortById");
			ModelAndView model = new ModelAndView("persons");
			model.addObject("persons", personDTOs);
			return model
		}
		else{
			ModelAndView model = new ModelAndView("add");
			model.addObject("resultMessage", resultMessage);
			model.addObject("roleNames", roleNameDTOs);
			return model;
		}
	}
	
	public void savePersonRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		recordLog("Added New Person Role.\n");
		String resultMessage = validation.checkAddRole(request, response);
		Long id = Long.parseLong(request.getParameter("personId"));
		service.addPersonRole(id); //check if you have personRole(long id) method
		response.sendRedirect("person.htm?action=view&OK=05");
	}
	
	public void deleteSelectedPersonRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		recordLog("Deleted 1 Person Role.\n");
		String resultMessage = validation.checkAddRole(request, response);
		Long id = Long.parseLong(request.getParameter("personId"));
		service.deletePersonRole(id); //check if you have deletePersonRole(long id) method
		response.sendRedirect("person.htm?action=view&OK=06");
	}
	
	public ModelAndView viewRoles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Set<RoleDTO> roleNameDTOs = service.getRoleNames();
		ModelAndView model = new ModelAndView("viewRoles");
		model.addObject("roleNames", roleNameDTOs);
		return model;
	}
	
	public void deleteRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Long id = Long.parseLong(request.getParameter("roleId"));
		String resultMessage = service.deleteRole(id) //check if you have deleteRole(long id) method
		if(resultMessage.equals("Clear")){
			recordLog("Deleted 1 Role.\n");
			response.sendRedirect("roles.htm?action=viewRoles&OK=01");
		}
		else{
			response.sendRedirect("roles.htm?action=viewRoles&OK=02");
		}
	}
	
	public void addRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String newRole = request.getParameter("newRole");
		String resultMessage = service.checkRole(newRole);
		RequestDispatcher rd = request.getRequestDispatcher("viewRoles.jsp");
		if(resultMessage.equals("Clear")){
			recordLog("Added A New Role.\n");
			service.addRole(newRole); //check if you have addRole(String newRole);
			response.sendRedirect("roles.htm?action=viewRoles&OK=03");
		}
		else{
			response.sendRedirect("roles.htm?action=viewRoles&OK=04");
		}
	}
	
	public ModelAndView addNewPersonByFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		return new ModelAndView("upload");
	}
	
	public ModelAndView upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		BufferedReader in = null;
		MultipartFile multipartFile = file.getFile();
		String fileName = "";
		System.out.println("multip: " + multipartFile);
		
		if(!multipartFile.getOriginalFilename().equals("")){
			System.out.println("FILENAME: " + multipartFile.getOriginalFilename());
			recordLog("Added A New Person From Uploaded File.\n");
			String uploadsDir = "/uploads/";
			String realPathtoUploads = request.getServletContext().getRealPath("/newPerson.txt");
			
			if(!new File(realPathtoUploads).exists()){
				new File(realPathtoUploads).mkdir();
			}
			
			File dest = new File(realPathtoUploads);
			multipartFile.transferTo(dest);
			String orgName = multipartFile.getOriginalFilename();
			String filePath = request.getServletContext().getRealPath("/") + "//newPerson.txt";
			
			String resultMessage = fileValidation.checkAddPersonByFile(filePath);
			
			if(resultMessage.equals("Clear")){
				Set<RoleDTO> roleNameDTOs = service.getRoleNames();
				service.saveNewPersonFromFile(roleNameDTOs, realPathtoUploads) //create THIS method
				List<EmployeeDTO> personDTOs = service.sortPerson("sortById");
				ModelAndView model = new ModelAndView("persons");
				model.addObject("persons", personDTOs);
				return model;
			}
			else{
				return new ModelAndView("upload").addObject("resultMessage", resultMessage);
			}
		}	
	}
	
	public void recordLog(String logMessage){
		logger.info("INFO: " + logMessage);
		if(logger.isDebugEnabled()){
			logger.debug("");
		}
	}
}
