package com.nathanm.savetravels.controllers;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.nathanm.savetravels.models.Expense;
import com.nathanm.savetravels.services.ExpenseService;

import jakarta.validation.Valid;

//@RequestMapping("/expenses")
@Controller
public class HomeController {
	
	@Autowired
	private ExpenseService service;

	@GetMapping("")
	public String index() {
		return "redirect:/home";
	}
	
	@GetMapping("/home")
	public String home(@ModelAttribute("expense") Expense expense, Model viewmodel) {
		List<Expense> allExpenses = service.all();
		viewmodel.addAttribute("allExpenses", allExpenses);
		return "index.jsp";
	}
	
	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}
		else {
			service.create(expense);
			return "redirect:/home";
		}
	}
	@GetMapping("/show/{id}")
	public String show(@PathVariable Long id, Model viewmodel) {
		Expense expense = service.get(id);
		viewmodel.addAttribute("expense", expense);
		return "show.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model viewmodel) {
		Expense expense = service.get(id);
		viewmodel.addAttribute("expense", expense);
		return "edit.jsp";
	}

	@PutMapping("/update/{id}")
	public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result,
			@PathVariable Long id) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			service.update(expense);
			return "redirect:/";
		}
	}
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		service.destroy(id);
		return "redirect:/home";
	}
	
}
