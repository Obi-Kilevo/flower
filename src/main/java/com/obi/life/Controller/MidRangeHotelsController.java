package com.obi.life.Controller;

import com.obi.life.Entity.MidrangeHotelsEntity;
import com.obi.life.Repository.MidRangeHotelsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/mhotels")
public class MidRangeHotelsController {

    @Autowired
    private MidRangeHotelsRepository midRangeHotelsRepository;

    // ADMIN DASHBOARD
    @GetMapping("/admin")
    public String adminHotels(Model model) {
        model.addAttribute("hotels", midRangeHotelsRepository.findAll());
        model.addAttribute("newHotel", new MidrangeHotelsEntity());
        return "facehotels/mid-range/admin";
    }

    // ADD NEW HOTEL
    @PostMapping("/admin")
    public String addHotelFromForm(@ModelAttribute MidrangeHotelsEntity newHotel) {
        midRangeHotelsRepository.save(newHotel);
        return "redirect:/mhotels/admin";
    }

    // DELETE HOTEL
    @PostMapping("/admin/delete/{id}")
    public String deleteHotelFromForm(@PathVariable Long id) {
        midRangeHotelsRepository.deleteById(id);
        return "redirect:/mhotels/admin";
    }

    // EDIT FORM
    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<MidrangeHotelsEntity> hotel = midRangeHotelsRepository.findById(id);
        if (hotel.isEmpty()) return "redirect:/mhotels/admin";
        model.addAttribute("hotel", hotel.get());
        return "facehotels/mid-range/edit";
    }

    // UPDATE HOTEL
    @PostMapping("/admin/update/{id}")
    public String updateHotel(@PathVariable Long id, @ModelAttribute MidrangeHotelsEntity updatedHotel) {
        Optional<MidrangeHotelsEntity> hotel = midRangeHotelsRepository.findById(id);
        if (hotel.isPresent()) {
            MidrangeHotelsEntity h = hotel.get();
            h.setName(updatedHotel.getName());
            h.setCity(updatedHotel.getCity());
            h.setCountry(updatedHotel.getCountry());
            h.setAddress(updatedHotel.getAddress());
            h.setPrice(updatedHotel.getPrice());
            h.setCurrency(updatedHotel.getCurrency());
            h.setImageUrl(updatedHotel.getImageUrl());
            h.setFeatures(updatedHotel.getFeatures());
            h.setFormPath(updatedHotel.getFormPath());
            midRangeHotelsRepository.save(h);
        }
        return "redirect:/mhotels/admin";
    }

    // ALL HOTELS
    @GetMapping("/all")
    public String allMidRangeHotels(Model model) {
        model.addAttribute("hotels", midRangeHotelsRepository.findAll());
        return "facehotels/mid-range/all";
    }
}