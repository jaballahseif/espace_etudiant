package entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the enseignant database table.
 * 
 */
@Entity
@NamedQuery(name="Enseignant.findAll", query="SELECT e FROM Enseignant e")
public class Enseignant implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_enseignant")
	private int idEnseignant;

	private String email;

	private String fname;

	private String lname;

	private String password;

	private String role;

	public Enseignant() {
	}
	public Enseignant(String fname,String lname,String email , String password,String role) {
		this.fname=fname;
		this.lname=lname;
		this.email=email;
		this.password=password;
		this.role=role;
	}

	public int getIdEnseignant() {
		return this.idEnseignant;
	}

	public void setIdEnseignant(int idEnseignant) {
		this.idEnseignant = idEnseignant;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return this.lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}