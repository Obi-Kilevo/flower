package com.obi.life.Controller;

import com.obi.life.Entity.MountainsEntity;
import com.obi.life.Repository.MountainsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/mountain")
public class MountainsController {

    @Autowired
    private MountainsRepository mountainsRepository;

    // =================== ADMIN MOUNTAINS MANAGEMENT ===================
    @GetMapping("/admin")
    public String adminMountains(Model model) {
        model.addAttribute("mountains", mountainsRepository.findAll());
        model.addAttribute("newMountain", new MountainsEntity());
        return "mountains/admin";
    }

    @PostMapping("/admin")
    public String addMountainFromForm(@ModelAttribute MountainsEntity newMountain) {
        mountainsRepository.save(newMountain);
        return "redirect:/mountain/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteMountainFromForm(@PathVariable Long id) {
        mountainsRepository.deleteById(id);
        return "redirect:/mountain/admin";
    }

    // Show edit form
    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<MountainsEntity> mountain = mountainsRepository.findById(id);
        if (mountain.isEmpty()) return "redirect:/mountain/admin";
        model.addAttribute("mountain", mountain.get());
        return "mountains/edit";
    }

    // Update mountain
    @PostMapping("/admin/update/{id}")
    public String updateMountain(@PathVariable Long id, @ModelAttribute MountainsEntity updatedMountain) {
        Optional<MountainsEntity> mountain = mountainsRepository.findById(id);
        if (mountain.isPresent()) {
            MountainsEntity m = mountain.get();
            m.setName(updatedMountain.getName());
            m.setFeatures(updatedMountain.getFeatures());
            m.setImageUrl(updatedMountain.getImageUrl());
            m.setUpdatedAt(LocalDateTime.now());
            mountainsRepository.save(m);
        }
        return "redirect:/mountain/admin";
    }


    @GetMapping("/all")
    public String allMountains(Model model) {
        model.addAttribute("mountains", mountainsRepository.findAll());
        return "mountains/all";
    }
}