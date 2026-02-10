package com.obi.life.Controller;

import com.obi.life.Entity.BudgetCampsEntity;
import com.obi.life.Repository.BudgetCampsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/bcamps")
public class BudgetCampsController {

    @Autowired
    private BudgetCampsRepository budgetCampsRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminCamps(Model model) {
        model.addAttribute("camps", budgetCampsRepository.findAll());
        model.addAttribute("newCamp", new BudgetCampsEntity());
        return "facecamps/budget/admin";
    }

    @PostMapping("/admin")
    public String addCampFromForm(@ModelAttribute BudgetCampsEntity newCamp) {
        budgetCampsRepository.save(newCamp);
        return "redirect:/bcamps/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteCampFromForm(@PathVariable Long id) {
        budgetCampsRepository.deleteById(id);
        return "redirect:/bcamps/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<BudgetCampsEntity> camp = budgetCampsRepository.findById(id);
        if (camp.isEmpty()) return "redirect:/bcamps/admin";
        model.addAttribute("camp", camp.get());
        return "facecamps/budget/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateCamp(@PathVariable Long id, @ModelAttribute BudgetCampsEntity updatedCamp) {
        Optional<BudgetCampsEntity> camp = budgetCampsRepository.findById(id);
        if (camp.isPresent()) {
            BudgetCampsEntity c = camp.get();
            c.setName(updatedCamp.getName());
            c.setCity(updatedCamp.getCity());
            c.setCountry(updatedCamp.getCountry());
            c.setAddress(updatedCamp.getAddress());
            c.setPrice(updatedCamp.getPrice());
            c.setCurrency(updatedCamp.getCurrency());
            c.setImageUrl(updatedCamp.getImageUrl());
            c.setFeatures(updatedCamp.getFeatures());
            c.setFromPath(updatedCamp.getFromPath());
            c.setFormPath(updatedCamp.getFormPath());
            c.setUpdatedAt(LocalDateTime.now());
            budgetCampsRepository.save(c);
        }
        return "redirect:/bcamps/admin";
    }

    @GetMapping("/all")
    public String allCamps(Model model) {
        model.addAttribute("camps", budgetCampsRepository.findAll());
        return "facecamps/budget/all";
    }
}