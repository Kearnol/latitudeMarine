package com.dk.latmarine.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="roles")
public class Role {
	
	@Id
    @GeneratedValue
    private Long id;
    private String name;
    
 // ======================
 // Related Data
 // ======================
    
    @ManyToMany(mappedBy = "roles")
    private List<User> users;
    
    
 // ======================
 // Constructors
 // ======================
    
    public Role() {
    }
    
 // ======================
 // Getters & Setters
 // ======================     
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public List<User> getUsers() {
        return users;
    }
    public void setUsers(List<User> users) {
        this.users = users;
    }
}
