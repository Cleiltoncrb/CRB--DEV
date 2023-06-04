package com.devsuperior.userdept.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.devsuperior.userdept.entities.User;
import com.devsuperior.userdept.respositories.UserRepository;

@RestController
@RequestMapping(value = "/users")
public class UserController {
	
	@Autowired
	private UserRepository repository;
		
	@GetMapping // endpoint para listar todos os usuário do Banco de dados 
	public List<User> findAll(){
		List<User> result = repository.findAll();
		return result;		
	}
	
	@GetMapping(value = "/{id}" ) // endpoint para trazer um usuário do bando por Id
	public User findById(@PathVariable Long id){
		User result = repository.findById(id).get();
		return result;
		
	}
	
	@PostMapping // endpoint para salvar um novo usuário no Banco de Dados 
	public User insert(@RequestBody User user){
		User result = repository.save(user);
		return result;
		
	}
}
