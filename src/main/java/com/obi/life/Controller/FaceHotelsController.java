package com.obi.life.Controller;

import com.obi.life.Entity.FaceHotelsEntity;
import com.obi.life.Repository.FaceHotelsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/fhotels")
public class FaceHotelsController {

    @Autowired
    private FaceHotelsRepository faceHotelsRepository;

    // =================== USER SIDE ===================

    @GetMapping("/hotel/{id}")
    public String redirectToHotel(@PathVariable Long id) {
        Optional<FaceHotelsEntity> hotelOpt = faceHotelsRepository.findById(id);
        if (hotelOpt.isEmpty()) {
            return "redirect:/";
        }
        return "facehotels/user/hotelpage";  // Updated path
    }

    // =================== ADMIN SIDE ===================

    @GetMapping("/admin")
    public String adminFaceHotels(Model model) {
        model.addAttribute("hotels", faceHotelsRepository.findAll());
        model.addAttribute("newHotel", new FaceHotelsEntity());
        return "facehotels/admin";  // Updated path
    }

    @PostMapping("/admin")
    public String addHotel(@ModelAttribute FaceHotelsEntity newHotel) {
        newHotel.setCreatedAt(LocalDateTime.now());
        newHotel.setUpdatedAt(LocalDateTime.now());
        faceHotelsRepository.save(newHotel);
        return "redirect:/fhotels/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteHotel(@PathVariable Long id) {
        faceHotelsRepository.deleteById(id);
        return "redirect:/fhotels/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String editHotel(@PathVariable Long id, Model model) {
        Optional<FaceHotelsEntity> hotel = faceHotelsRepository.findById(id);
        if (hotel.isEmpty()) {
            return "redirect:/fhotels/admin";
        }
        model.addAttribute("hotel", hotel.get());
        return "facehotels/edit";  // Updated path
    }

    @PostMapping("/admin/update/{id}")
    public String updateHotel(
            @PathVariable Long id,
            @ModelAttribute FaceHotelsEntity updatedHotel
    ) {
        Optional<FaceHotelsEntity> hotelOpt = faceHotelsRepository.findById(id);
        if (hotelOpt.isPresent()) {
            FaceHotelsEntity h = hotelOpt.get();

            h.setName(updatedHotel.getName());
            h.setCity(updatedHotel.getCity());
            h.setCountry(updatedHotel.getCountry());
            h.setAddress(updatedHotel.getAddress());
            h.setPrice(updatedHotel.getPrice());
            h.setCurrency(updatedHotel.getCurrency());
            h.setFeatures(updatedHotel.getFeatures());
            h.setImageUrl(updatedHotel.getImageUrl());
            h.setFormPath(updatedHotel.getFormPath());

            h.setUpdatedAt(LocalDateTime.now());

            faceHotelsRepository.save(h);
        }
        return "redirect:/fhotels/admin";
    }

}