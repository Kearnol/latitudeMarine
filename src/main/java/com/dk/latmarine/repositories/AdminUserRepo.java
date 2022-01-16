package com.dk.latmarine.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dk.latmarine.models.AdminUser;

@Repository
public interface AdminUserRepo extends CrudRepository<AdminUser, Long> {
	
}
