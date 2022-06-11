package com.example.demo.modal;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="imagetable")
public class image {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String filetype;
	@Lob
	private byte[] bytes;
	private String filename;
	 private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public byte[] getBytes() {
		return bytes;
	}
	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public image()
	{
		
	}
	public image(String name,String filetype, byte[] bytes, String filename) {
		super();
		this.name=name;
		this.filetype = filetype;
		this.bytes = bytes;
		this.filename = filename;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "image [id=" + id + ", filetype=" + filetype + ", bytes=" + Arrays.toString(bytes) + ", filename="
				+ filename + ", name=" + name + "]";
	}
	

}
