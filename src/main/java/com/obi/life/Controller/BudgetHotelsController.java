package com.obi.life.Controller;

import com.obi.life.Entity.BudgetHotelsEntity;
import com.obi.life.Repository.BudgetHotelsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/bhotels")
public class BudgetHotelsController {

    @Autowired
    private BudgetHotelsRepository budgetHotelsRepository;

    // ADMIN DASHBOARD (LOADS HOTELS + EMPTY FORM)
    @GetMapping("/admin")
    public String adminHotels(Model model) {
        model.addAttribute("hotels", budgetHotelsRepository.findAll());
        model.addAttribute("newHotel", new BudgetHotelsEntity());
        return "facehotels/budget/admin";
    }

    // ADD NEW HOTEL (SIMPLIFIED - TIMESTAMPS AUTO-SET VIA @PrePersist)
    @PostMapping("/admin")
    public String addHotelFromForm(@ModelAttribute BudgetHotelsEntity newHotel) {
        budgetHotelsRepository.save(newHotel); // Timestamps auto-set here
        return "redirect:/bhotels/admin";
    }

    // DELETE HOTEL (UNCHANGED - WORKS)
    @PostMapping("/admin/delete/{id}")
    public String deleteHotelFromForm(@PathVariable Long id) {
        budgetHotelsRepository.deleteById(id);
        return "redirect:/bhotels/admin";
    }

    // EDIT FORM (UNCHANGED)
    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<BudgetHotelsEntity> hotel = budgetHotelsRepository.findById(id);
        if (hotel.isEmpty()) return "redirect:/bhotels/admin";
        model.addAttribute("hotel", hotel.get());
        return "facehotels/budget/edit";
    }

    // UPDATE HOTEL (UNCHANGED - @PreUpdate AUTO-SETS updatedAt)
    @PostMapping("/admin/update/{id}")
    public String updateHotel(@PathVariable Long id, @ModelAttribute BudgetHotelsEntity updatedHotel) {
        Optional<BudgetHotelsEntity> hotel = budgetHotelsRepository.findById(id);
        if (hotel.isPresent()) {
            BudgetHotelsEntity h = hotel.get();
            h.setName(updatedHotel.getName());
            h.setCity(updatedHotel.getCity());
            h.setCountry(updatedHotel.getCountry());
            h.setAddress(updatedHotel.getAddress());
            h.setPrice(updatedHotel.getPrice());
            h.setCurrency(updatedHotel.getCurrency());
            h.setImageUrl(updatedHotel.getImageUrl());
            h.setFeatures(updatedHotel.getFeatures());
            h.setFormPath(updatedHotel.getFormPath());
            budgetHotelsRepository.save(h); // @PreUpdate auto-sets updatedAt
        }
        return "redirect:/bhotels/admin";
    }

    // ALL HOTELS (UNCHANGED)
    @GetMapping("/all")
    public String allBudgetHotels(Model model) {
        model.addAttribute("hotels", budgetHotelsRepository.findAll());
        return "facehotels/budget/all";
    }
}
