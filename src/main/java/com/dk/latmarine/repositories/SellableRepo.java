package com.dk.latmarine.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dk.latmarine.models.Sellable;

@Repository
public interface SellableRepo extends CrudRepository<Sellable, Long> {
	
	public Iterable<Sellable> findByType(String type);

}
