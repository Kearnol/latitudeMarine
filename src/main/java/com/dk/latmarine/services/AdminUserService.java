package com.dk.latmarine.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dk.latmarine.repositories.AdminUserRepo;

@Service
public class AdminUserService {
	@Autowired
	AdminUserRepo adminUserRepo;
}
