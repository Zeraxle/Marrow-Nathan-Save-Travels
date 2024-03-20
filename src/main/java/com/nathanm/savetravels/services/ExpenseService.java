package com.nathanm.savetravels.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nathanm.savetravels.models.Expense;
import com.nathanm.savetravels.repositories.ExpenseRepository;


@Service
public class ExpenseService {
	
	@Autowired
	public ExpenseRepository repo;

	public List<Expense> all(){
		return repo.findAll();
	}
	
	public Expense get(Long id) {
		return repo.findById(id).orElse(null);
	}
	
	public Expense create(Expense expense) {
        return repo.save(expense);
	}
	
	
	public Expense update(Expense expense) {
		return repo.save(expense);
	}
	
	public void destroy(Long id) {
		repo.deleteById(id);
	}
}
	
	
	
	
	
	
