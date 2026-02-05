package com.obi.life.Controller;

import com.obi.life.Entity.CampEntity;
import com.obi.life.Repository.CampRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/camp")
public class CampController {

    @Autowired
    private CampRepository campRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminCamps(Model model) {
        model.addAttribute("camps", campRepository.findAll());
        model.addAttribute("newCamp", new CampEntity());
        return "camp/admin";
    }

    @PostMapping("/admin")
    public String addCampFromForm(@ModelAttribute CampEntity newCamp) {
        campRepository.save(newCamp);
        return "redirect:/camp/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteCampFromForm(@PathVariable Long id) {
        campRepository.deleteById(id);
        return "redirect:/camp/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<CampEntity> camp = campRepository.findById(id);
        if (camp.isEmpty()) return "redirect:/camp/admin";
        model.addAttribute("camp", camp.get());
        return "camp/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateCamp(@PathVariable Long id, @ModelAttribute CampEntity updatedCamp) {
        Optional<CampEntity> camp = campRepository.findById(id);
        if (camp.isPresent()) {
            CampEntity c = camp.get();
            c.setName(updatedCamp.getName());
            c.setCity(updatedCamp.getCity());
            c.setCountry(updatedCamp.getCountry());
            c.setAddress(updatedCamp.getAddress());
            c.setPrice(updatedCamp.getPrice());
            c.setCurrency(updatedCamp.getCurrency());
            c.setImageUrl(updatedCamp.getImageUrl());
            c.setFeatures(updatedCamp.getFeatures());
            c.setUpdatedAt(LocalDateTime.now());
            campRepository.save(c);
        }
        return "redirect:/camp/admin";
    }
}