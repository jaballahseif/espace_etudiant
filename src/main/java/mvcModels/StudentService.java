package mvcModels;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import entities.Admin;
import entities.Enseignant;
import entities.Etudiant;
import entities.Note;

/**
 * Session Bean implementation class StudentService
 */
@Stateless
@LocalBean
public class StudentService {
	@PersistenceContext(unitName="espace_etudiant")
    private EntityManager em;
    /**
     * Default constructor. 
     */
    public StudentService() {
        // TODO Auto-generated constructor stub
    }    
    public String authenticate(String email, String password) {
        try {
            TypedQuery<Etudiant> etudiantQuery = em.createQuery("SELECT e FROM Etudiant e WHERE e.email = :email", Etudiant.class);
            etudiantQuery.setParameter("email", email);
            Etudiant etudiant = etudiantQuery.getSingleResult();
            if (etudiant != null && etudiant.getPassword().equals(password)) {
                return "etudiant";
            }
        } catch (NoResultException ignored) {
        }
        
        try {
            TypedQuery<Enseignant> enseignantQuery = em.createQuery("SELECT e FROM Enseignant e WHERE e.email = :email", Enseignant.class);
            enseignantQuery.setParameter("email", email);
            Enseignant enseignant = enseignantQuery.getSingleResult();
            if (enseignant != null && enseignant.getPassword().equals(password)) {
                return "enseignant";
            }
        } catch (NoResultException ignored) {
        }
        
        try {
            TypedQuery<Admin> adminQuery = em.createQuery("SELECT a FROM Admin a WHERE a.email = :email", Admin.class);
            adminQuery.setParameter("email", email);
            Admin admin = adminQuery.getSingleResult();
            if (admin != null && admin.getPassword().equals(password)) {
                return "admin";
            }
        } catch (NoResultException ignored) {
        }
        
        // Authentication failed
        return null;
    }
 
    public List<Etudiant> getAllEtudiants()
    {
    List<Etudiant> etudiants = new ArrayList<Etudiant>();
    TypedQuery<Etudiant> query = em.createNamedQuery("Etudiant.findAll",Etudiant.class);
    etudiants = query.getResultList();
    return etudiants;
    }
    public List<Enseignant> getAllEnseignants()
    {
    List<Enseignant> enseignants = new ArrayList<Enseignant>();
    TypedQuery<Enseignant> query = em.createNamedQuery("Enseignant.findAll",Enseignant.class);
    enseignants = query.getResultList();
    return enseignants;
    }
    public List<Enseignant>deleteEnseignantById(int EnseignantId){
    	   List<Enseignant> enseignants = new ArrayList<Enseignant>();
    	   Enseignant ed = em.find(Enseignant.class, EnseignantId);
    	    if(ed!=null)
    	    em.remove(ed);
    	    TypedQuery<Enseignant> query =
    	    em.createNamedQuery("Enseignant.findAll",Enseignant.class);
    	    enseignants = query.getResultList();
    	    return enseignants;
    	
    }
   public List<Etudiant> deleteEtudiantById(int EtudiantId){
	   List<Etudiant> etudiants = new ArrayList<Etudiant>();
	   Etudiant ed = em.find(Etudiant.class, EtudiantId);
	    if(ed!=null)
	    em.remove(ed);
	    TypedQuery<Etudiant> query =
	    em.createNamedQuery("Etudiant.findAll",Etudiant.class);
	    etudiants = query.getResultList();
	    return etudiants;
   }
   public Etudiant getEtudiantById(int EtudiantId){
	   Etudiant etudiant = em.find(Etudiant.class, EtudiantId);
  
       return etudiant;
   }
   public List<Etudiant> modifEtudiant(int EtudiantId,String fname,String lname,String email)
   {
       List<Etudiant> etudiants = new ArrayList<Etudiant>();
       Etudiant etudiant = em.find(Etudiant.class, EtudiantId);
       if(etudiant!=null) {
    	   etudiant.setFname(fname);
    	   etudiant.setLname(lname);
    	   etudiant.setEmail(email);
           em.merge(etudiant);
       }

       TypedQuery<Etudiant> query = em.createNamedQuery("Etudiant.findAll", Etudiant.class);
       etudiants = query.getResultList();
       return etudiants;
   }
public List<Admin> addAdmin(String fname,String lname,String email , String password,String role){
    List<Admin> admins = new ArrayList<Admin>();

	Admin newAdmin = new Admin(fname,lname, email ,  password, role);
	em.persist(newAdmin);
    TypedQuery<Admin> query = em.createNamedQuery("Admin.findAll", Admin.class);
    admins = query.getResultList();
    return admins;
}
public List<Etudiant> addEtudiant(String fname,String lname,String email , String password,String role){
    List<Etudiant> etudiants = new ArrayList<Etudiant>();

    Etudiant newEtudiant = new Etudiant(fname,lname, email ,  password, role);
	em.persist(newEtudiant);
    TypedQuery<Etudiant> query = em.createNamedQuery("Etudiant.findAll", Etudiant.class);
    etudiants = query.getResultList();
    return etudiants;
}
public List<Enseignant> addEnseignant(String fname,String lname,String email , String password,String role){
    List<Enseignant> enseignants = new ArrayList<Enseignant>();

    Enseignant newenseignants = new Enseignant(fname,lname, email ,  password, role);
	em.persist(newenseignants);
    TypedQuery<Enseignant> query = em.createNamedQuery("Enseignant.findAll", Enseignant.class);
    enseignants = query.getResultList();
    return enseignants;
}
public List<Note> addNote(int idenseignant,int idetudiant, String matiere,float note){
	List<Note> notes = new ArrayList<Note>();
	Note newNote = new Note(idenseignant,idetudiant,matiere,note);
	em.persist(newNote);
	  TypedQuery<Note> query = em.createNamedQuery("Note.findAll", Note.class);
	  notes = query.getResultList();
	return notes;
	
}
public Enseignant getEnseignantById(int EnseignantId){
	Enseignant enseignant = em.find(Enseignant.class, EnseignantId);

    return enseignant;
}
public List<Enseignant> modifEnseignant(int ide,String fname, String lname, String email)
{
    List<Enseignant> enseignants = new ArrayList<Enseignant>();
    Enseignant en = em.find(Enseignant.class, ide);
    if(en!=null) {
    	en.setFname(fname);
    	en.setLname(lname);
    	en.setEmail(email);
         em.merge(en);
    }

    TypedQuery<Enseignant> query = em.createNamedQuery("Enseignant.findAll", Enseignant.class);
    enseignants = query.getResultList();
    return enseignants;
}


}
