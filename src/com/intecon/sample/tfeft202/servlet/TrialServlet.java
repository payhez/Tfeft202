package com.intecon.sample.tfeft202.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.intecon.sample.tfeft202.model.Tfeft202;
import com.intecon.sample.tfeft202.service.TrialService;

/**
 * Servlet implementation class TrialServlet
 */
@WebServlet("/TrialServlet")
public class TrialServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private TrialService service;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrialServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Gson gson= new Gson();
		String json="";
		String json_req ="";
		
		service = new TrialService();	
		
		final BufferedReader br = new BufferedReader(new InputStreamReader((InputStream) request.getInputStream(), Charset.forName("UTF-8")));
		if (br != null) {
			json_req = br.readLine();
		}
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		Tfeft202 theObject = gson.fromJson(json_req, Tfeft202.class);
		
		try {
			switch (theObject.action) {
			
			case "insert":
				
				if(service.insert(theObject)) {
					response.getWriter().write("The Item is added successfully");
				}else {
					response.getWriter().write("Cannot be added!");
				}
				break;
				
			case "delete":
				
				if(service.delete(theObject)) {
					response.getWriter().write("The Item is deleted successfully");
				}else {
					response.getWriter().write("Cannot be deleted!");
				}
				break;
			case "update":
				
				if(service.update(theObject)) {
					response.getWriter().write("The Item is updated successfully");
				}else {
					response.getWriter().write("Cannot be updated!");
				}
				break;
				
			case "fetch":
				
				List<Tfeft202> objectList = new ArrayList<>();
				objectList=service.fetch();
				json=gson.toJson(objectList);
				
				response.setContentType("application/json");
			    response.setCharacterEncoding("UTF-8");
			    response.getWriter().write(json);
				
				break;
			default:
				
				List<Tfeft202> defaultObjectList = new ArrayList<>();
				defaultObjectList=service.fetch();
				json=gson.toJson(defaultObjectList);
				
				response.setContentType("application/json");
			    response.setCharacterEncoding("UTF-8");
			    response.getWriter().write(json);
				
				break;
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	

}
