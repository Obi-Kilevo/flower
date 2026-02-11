package com.obi.life.Controller;

import com.obi.life.Entity.LuxuryLodgesEntity;
import com.obi.life.Repository.LuxuryLodgesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/lodges")
public class LuxuryLodgesController {

    @Autowired
    private LuxuryLodgesRepository lodgesRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminLodges(Model model) {
        model.addAttribute("lodges", lodgesRepository.findAll());
        model.addAttribute("newLodge", new LuxuryLodgesEntity());
        return "facelodges/luxury/admin";
    }

    @PostMapping("/admin")
    public String addLodgeFromForm(@ModelAttribute LuxuryLodgesEntity newLodge) {
        lodgesRepository.save(newLodge);
        return "redirect:/lodges/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteLodgeFromForm(@PathVariable Long id) {
        lodgesRepository.deleteById(id);
        return "redirect:/lodges/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<LuxuryLodgesEntity> lodge = lodgesRepository.findById(id);
        if (lodge.isEmpty()) return "redirect:/lodges/admin";
        model.addAttribute("lodge", lodge.get());
        return "facelodges/luxury/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateLodge(@PathVariable Long id, @ModelAttribute LuxuryLodgesEntity updatedLodge) {
        Optional<LuxuryLodgesEntity> lodge = lodgesRepository.findById(id);
        if (lodge.isPresent()) {
            LuxuryLodgesEntity l = lodge.get();
            l.setName(updatedLodge.getName());
            l.setCity(updatedLodge.getCity());
            l.setCountry(updatedLodge.getCountry());
            l.setAddress(updatedLodge.getAddress());
            l.setPrice(updatedLodge.getPrice());
            l.setCurrency(updatedLodge.getCurrency());
            l.setImageUrl(updatedLodge.getImageUrl());
            l.setFeatures(updatedLodge.getFeatures());
            l.setUpdatedAt(LocalDateTime.now());
            l.setFormPath(updatedLodge.getFormPath());
            lodgesRepository.save(l);
        }
        return "redirect:/lodges/admin";
    }

        @GetMapping("/all")
    public String allLodges(Model model) {
        model.addAttribute("lodges", lodgesRepository.findAll());
        return "facelodges/luxury/all";
    }
}