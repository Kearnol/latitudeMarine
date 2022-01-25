package com.dk.latmarine.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dk.latmarine.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {
	
	User findByUsername(String username);
	
}
