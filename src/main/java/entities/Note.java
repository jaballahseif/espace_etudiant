package entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the note database table.
 * 
 */
@Entity
@NamedQuery(name="Note.findAll", query="SELECT n FROM Note n")
public class Note implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_note")
	private int idNote;

	private int idenseignant;

	private int idetudiant;

	private String matiere;

	private float note;

	public Note() {
	}
	public Note(int idenseignant,int idetudiant, String matiere,float note) {
		this.idenseignant = idenseignant;
		this.idetudiant = idetudiant;
		this.matiere = matiere;
		this.note = note;
	}

	public int getIdNote() {
		return this.idNote;
	}

	public void setIdNote(int idNote) {
		this.idNote = idNote;
	}

	public int getIdenseignant() {
		return this.idenseignant;
	}

	public void setIdenseignant(int idenseignant) {
		this.idenseignant = idenseignant;
	}

	public int getIdetudiant() {
		return this.idetudiant;
	}

	public void setIdetudiant(int idetudiant) {
		this.idetudiant = idetudiant;
	}

	public String getMatiere() {
		return this.matiere;
	}

	public void setMatiere(String matiere) {
		this.matiere = matiere;
	}

	public float getNote() {
		return this.note;
	}

	public void setNote(float note) {
		this.note = note;
	}

}