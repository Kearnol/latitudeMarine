package com.dk.latmarine.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dk.latmarine.models.Photo;

@Repository
public interface PhotoRepo extends CrudRepository<Photo, Long>{
	
}
