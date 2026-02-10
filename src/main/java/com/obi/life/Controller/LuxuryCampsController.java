package com.obi.life.Controller;

import com.obi.life.Entity.LuxuryCampsEntity;
import com.obi.life.Repository.CampRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/lcamps")
public class LuxuryCampsController {

    @Autowired
    private CampRepository campRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminCamps(Model model) {
        model.addAttribute("camps", campRepository.findAll());
        model.addAttribute("newCamp", new LuxuryCampsEntity());
        return "facecamps/luxury/admin";
    }

    @PostMapping("/admin")
    public String addCampFromForm(@ModelAttribute LuxuryCampsEntity newCamp) {
        campRepository.save(newCamp);
        return "redirect:/lcamps/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteCampFromForm(@PathVariable Long id) {
        campRepository.deleteById(id);
        return "redirect:/lcamps/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<LuxuryCampsEntity> camp = campRepository.findById(id);
        if (camp.isEmpty()) return "redirect:/lcamps/admin";
        model.addAttribute("camp", camp.get());
        return "facecamps/luxury/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateCamp(@PathVariable Long id, @ModelAttribute LuxuryCampsEntity updatedCamp) {
        Optional<LuxuryCampsEntity> camp = campRepository.findById(id);
        if (camp.isPresent()) {
            LuxuryCampsEntity c = camp.get();
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
        return "redirect:/lcamps/admin";
    }

    @GetMapping("/all")
    public String allCamps(Model model) {
        model.addAttribute("camps", campRepository.findAll());
        return "facecamps/luxury/all"; // or your template name
    }
}