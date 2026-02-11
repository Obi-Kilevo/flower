package com.obi.life.Controller;

import com.obi.life.Entity.BudgetLodgesEntity;
import com.obi.life.Repository.BudgetLodgesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/blodges")
public class BudgetLodgesController {

    @Autowired
    private BudgetLodgesRepository budgetLodgesRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminLodges(Model model) {
        model.addAttribute("lodges", budgetLodgesRepository.findAll());
        model.addAttribute("newLodge", new BudgetLodgesEntity());
        return "facelodges/budget/admin";
    }

    @PostMapping("/admin")
    public String addLodgeFromForm(@ModelAttribute BudgetLodgesEntity newLodge) {
        budgetLodgesRepository.save(newLodge);
        return "redirect:/blodges/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteLodgeFromForm(@PathVariable Long id) {
        budgetLodgesRepository.deleteById(id);
        return "redirect:/blodges/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<BudgetLodgesEntity> lodge = budgetLodgesRepository.findById(id);
        if (lodge.isEmpty()) return "redirect:/blodges/admin";
        model.addAttribute("lodge", lodge.get());
        return "facelodges/budget/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateLodge(@PathVariable Long id, @ModelAttribute BudgetLodgesEntity updatedLodge) {
        Optional<BudgetLodgesEntity> lodge = budgetLodgesRepository.findById(id);
        if (lodge.isPresent()) {
            BudgetLodgesEntity l = lodge.get();
            l.setName(updatedLodge.getName());
            l.setCity(updatedLodge.getCity());
            l.setCountry(updatedLodge.getCountry());
            l.setAddress(updatedLodge.getAddress());
            l.setPrice(updatedLodge.getPrice());
            l.setCurrency(updatedLodge.getCurrency());
            l.setImageUrl(updatedLodge.getImageUrl());
            l.setFeatures(updatedLodge.getFeatures());
            l.setFormPath(updatedLodge.getFormPath());
            l.setUpdatedAt(LocalDateTime.now());
            budgetLodgesRepository.save(l);
        }
        return "redirect:/blodges/admin";
    }

    @GetMapping("/all")
    public String allLodges(Model model) {
        model.addAttribute("lodges", budgetLodgesRepository.findAll());
        return "facelodges/budget/all";
    }
}