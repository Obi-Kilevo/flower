package com.obi.life.Controller;

import com.obi.life.Entity.LuxuryHotelsEntity;
import com.obi.life.Repository.LuxuryHotelsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;
@Controller
@RequestMapping("/luxury")
public class LuxuryHotelsController {

    @Autowired
    private LuxuryHotelsRepository luxuryHotelsRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminHotels(Model model) {
        model.addAttribute("hotels", luxuryHotelsRepository.findAll());
        model.addAttribute("newHotel", new LuxuryHotelsEntity());
        return "luxuryHotels/admin";
    }

    @PostMapping("/admin")
    public String addHotelFromForm(@ModelAttribute LuxuryHotelsEntity newHotel) {
        luxuryHotelsRepository.save(newHotel);
        return "redirect:/luxury/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteHotelFromForm(@PathVariable Long id) {
        luxuryHotelsRepository.deleteById(id);
        return "redirect:/luxury/admin";
    }

    // 1. GET method for showing edit form (NEW)
    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<LuxuryHotelsEntity> hotel = luxuryHotelsRepository.findById(id);
        if (hotel.isEmpty()) return "redirect:/luxury/admin";
        model.addAttribute("hotel", hotel.get());
        return "luxuryHotels/edit";
    }

    // 2. POST method for updating (RENAMED - was updateHotelFromForm)
    @PostMapping("/admin/update/{id}")
    public String updateHotel(@PathVariable Long id, @ModelAttribute LuxuryHotelsEntity updatedHotel) {
        Optional<LuxuryHotelsEntity> hotel = luxuryHotelsRepository.findById(id);
        if (hotel.isPresent()) {
            LuxuryHotelsEntity h = hotel.get();
            h.setName(updatedHotel.getName());
            h.setCity(updatedHotel.getCity());
            h.setCountry(updatedHotel.getCountry());
            h.setAddress(updatedHotel.getAddress());
            h.setPrice(updatedHotel.getPrice());
            h.setCurrency(updatedHotel.getCurrency());
            h.setImageUrl(updatedHotel.getImageUrl());
            h.setFeatures(updatedHotel.getFeatures());
            h.setUpdatedAt(LocalDateTime.now());
            luxuryHotelsRepository.save(h);
        }
        return "redirect:/luxury/admin";
    }
}