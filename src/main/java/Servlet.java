

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvcModels.StudentService;
import entities.Admin;
import entities.Enseignant;
import entities.Etudiant;
import entities.Note;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(name = "StudentService")
	private StudentService studentService;
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		 String action = request.getParameter("action");
		    RequestDispatcher rd;
		    if(action!=null) {
		if(action.equals("add")) {
			String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            if(role.equals("admin")&& role!=null) {
            List<Admin> admins = studentService.addAdmin(fname,lname,email,password,role);
            if(admins!=null) {
            	request.setAttribute("message","user admin added successefully");}
            else {
            	request.setAttribute("message","error to add user admin");	
            	}
            	rd = request.getRequestDispatcher("index.jsp");
            	rd.forward(request, response);
        }
            else if(role.equals("etudiant")&& role!=null){
                List<Etudiant> etudiants = studentService.addEtudiant(fname,lname,email,password,role);
                if(etudiants!=null) {
                	request.setAttribute("message","user etudiant added successefully");}
                else {
                	request.setAttribute("message","error to add user etudiant");	
                	}
                	rd = request.getRequestDispatcher("index.jsp");
                	rd.forward(request, response);
            	
            }else if (role.equals("enseignant")&& role!=null) {
                List<Enseignant> enseignants = studentService.addEnseignant(fname,lname,email,password,role);
                if(enseignants!=null) {
                	request.setAttribute("message","user enseignant added successefully");}
                else {
                	request.setAttribute("message","error to add user enseignant");	
                	}
                	rd = request.getRequestDispatcher("index.jsp");
                	rd.forward(request, response);

            	
            }
       

			
		}else
		if (action.equals("Login")) {
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		    String role = studentService.authenticate(email, password);
		    
		     if (role != null) { 
		    	 if (role.equals("admin")) {
		             rd = request.getRequestDispatcher("admin.jsp");
		             rd.forward(request, response);
		         } else if (role.equals("etudiant")) {
		             rd = request.getRequestDispatcher("student.jsp");
		             rd.forward(request, response);
		         } else if (role.equals("enseignant")) {
		             rd = request.getRequestDispatcher("teacher.jsp");
		             rd.forward(request, response);
		         }
		     } else {
		         request.setAttribute("message", "error login");
		         rd = request.getRequestDispatcher("login.jsp");
		         rd.forward(request, response);
		     }
		     }else 
		if (action.equals("listEtudiant")) {
			List<Etudiant> etudiants = new ArrayList<Etudiant>();

		    etudiants = studentService.getAllEtudiants();
		    request.setAttribute("etudiants", etudiants);
		    rd = request.getRequestDispatcher("list.jsp");
		    rd.forward(request, response);
		}else if (action.equals("listNote")) {
			List<Etudiant> etudiants = new ArrayList<Etudiant>();

		    etudiants = studentService.getAllEtudiants();
		    request.setAttribute("etudiant", etudiants);
		    rd = request.getRequestDispatcher("note.jsp");
		    rd.forward(request, response);
		}else
			if(action.equals("listEnseignant")) 
			{
				List<Enseignant> enseignants = new ArrayList<Enseignant>();

				enseignants = studentService.getAllEnseignants();
			    request.setAttribute("enseignants", enseignants);
			    rd = request.getRequestDispatcher("listTeacher.jsp");
			    rd.forward(request, response);
				
			}else
		if(action.contentEquals("deleteEtudiant"))
		{
			String id = request.getParameter("subId");
			if(id!=null)
			{
			int EtudiantId = Integer.parseInt(id);
			List<Etudiant> Etudiants = new ArrayList<Etudiant>();
			Etudiants = studentService.deleteEtudiantById(EtudiantId);
			request.setAttribute("Etudiants", Etudiants);
			response.sendRedirect("http://localhost:8181/espace_etudiant/Servlet?action=listEtudiant");
	        return;
			}
		}else if(action.contentEquals("deleteEnseignant")) 
		{
			String id = request.getParameter("subId");
			if(id!=null)
			{
			int EnseignantId = Integer.parseInt(id);
			List<Enseignant> Enseignants = new ArrayList<Enseignant>();
			Enseignants = studentService.deleteEnseignantById(EnseignantId);
			request.setAttribute("Enseignant", Enseignants);
			response.sendRedirect("http://localhost:8181/espace_etudiant/Servlet?action=listEnseignant");
	        return;
			}
		}else if(action.contentEquals("AddTeacher")) {
		
				{
	            rd = request.getRequestDispatcher("addteacher.jsp");
	            rd.forward(request, response);
				}
			
		}else if(action.contentEquals("addNote")) {
			String id = request.getParameter("ID");
			if(id!=null) {
				int ide = Integer.parseInt(id);
				 Etudiant etudiant = studentService.getEtudiantById(ide);
					request.setAttribute("etudiant", etudiant);
			}
			rd = request.getRequestDispatcher("addnote.jsp");
			rd.forward(request, response);
			
		}else if(action.contentEquals("readmin")){
			response.sendRedirect("admin.jsp");

			
		}else if(action.contentEquals("addstudent")) {
			{
	            rd = request.getRequestDispatcher("addStudent.jsp");
	            rd.forward(request, response);
			}
		}else
		if(action.contentEquals("modifierEtudiant"))
		{
			String id = request.getParameter("subId");
			if(id!=null)
			{
			int EtudiantId = Integer.parseInt(id);
	        Etudiant etudiant = studentService.getEtudiantById(EtudiantId);
			request.setAttribute("etudiant", etudiant);
			
			}
			rd = request.getRequestDispatcher("update.jsp");
			rd.forward(request, response);
		}else 
			if(action.contentEquals("addteacher")) {
				String fname = request.getParameter("fname");
			    String lname = request.getParameter("lname");
		         String email = request.getParameter("email");
		         String password = request.getParameter("password");
		         String role = request.getParameter("role");
		         if (role.equals("enseignant")&& role!=null) {
		                List<Enseignant> enseignants = studentService.addEnseignant(fname,lname,email,password,role);
		                if(enseignants!=null) {
		                	request.setAttribute("message","user enseignant added successefully");}
		                else {
		                	request.setAttribute("message","error to add user enseignant");	
		                	}
		                	rd = request.getRequestDispatcher("admin.jsp");
		                	rd.forward(request, response);
		         }
		           
			
			
			
		}
		else if(action.contentEquals("addetudiant")) {
			String fname = request.getParameter("fname");
		    String lname = request.getParameter("lname");
	         String email = request.getParameter("email");
	         String password = request.getParameter("password");
	         String role = request.getParameter("role");
	         if (role.equals("etudiant")&& role!=null) {
	        	 List<Etudiant> etudiants = studentService.addEtudiant(fname,lname,email,password,role);
	                if(etudiants!=null) {
	                	request.setAttribute("message","user etudiant added successefully");}
	                else {
	                	request.setAttribute("message","error to add user enseignant");	
	                	}
	                	rd = request.getRequestDispatcher("admin.jsp");
	                	rd.forward(request, response);
	         }
			
		}else
		if (action.contentEquals("update")) {
		    String fname = request.getParameter("fname");
		    String lname = request.getParameter("lname");
		    String email = request.getParameter("email");
		    String id = request.getParameter("id");
		    int ide = Integer.parseInt(id);
		    List<Etudiant> etudiants = studentService.modifEtudiant(ide,fname,lname,email);
		    if(etudiants != null) {
		        request.setAttribute("message", "ETUDIANT MODIFIER AVEC SUCCESS");
		    } else {
		        request.setAttribute("message", "erreur");
		    }

		    rd =request.getRequestDispatcher("admin.jsp");  
		    rd.forward(request,response);

		}else if (action.contentEquals("modifierEnseignant")) {
			String id = request.getParameter("subId");
			if(id!=null)
			{
			int EnseignantId = Integer.parseInt(id);
			Enseignant enseignant = studentService.getEnseignantById(EnseignantId);
			request.setAttribute("enseignant", enseignant);
			
			}
			rd = request.getRequestDispatcher("updateEnseignant.jsp");
			rd.forward(request, response);
			
		}else if(action.contentEquals("Modifier")) {
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String id = request.getParameter("id");
			int ide = Integer.parseInt(id);
			List<Enseignant> enseignants = studentService.modifEnseignant(ide,fname,lname,email);
			   if(enseignants != null) {
			        request.setAttribute("message", "enseignant modifier avec succes.");
			    } else {
			        request.setAttribute("message", "erreur");
			    }

			    rd =request.getRequestDispatcher("admin.jsp");  
			    rd.forward(request,response);
			

		} else if (action.contentEquals("Ajouter Note")) {
		    String id = request.getParameter("id");
		    String matiere = request.getParameter("matiere");
		    String note = request.getParameter("note");
		    
		    try {
		        int studentId = Integer.parseInt(id);
		        float noteValue = Float.parseFloat(note);
		        
		        List<Note> notes = studentService.addNote(1, studentId, matiere, noteValue);
		        
		        if (notes != null) {
		            request.setAttribute("message", "Note added successfully");
		        } else {
		            request.setAttribute("message", "Error adding note");
		        }
		        
		        rd = request.getRequestDispatcher("teacher.jsp");
		        rd.forward(request, response);
		    } catch (NumberFormatException e) {
		        request.setAttribute("message", "Invalid ID or note value");
		        rd = request.getRequestDispatcher("teacher.jsp");
		        rd.forward(request, response);
		    }
		}
		    }

 }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
