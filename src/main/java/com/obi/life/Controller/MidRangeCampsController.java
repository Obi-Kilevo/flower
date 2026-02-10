package com.obi.life.Controller;

import com.obi.life.Entity.MidRangeCampsEntity;
import com.obi.life.Repository.MidRangeCampsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/mcamps")
public class MidRangeCampsController {

    @Autowired
    private MidRangeCampsRepository midRangeRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminCamps(Model model) {
        model.addAttribute("camps", midRangeRepository.findAll());
        model.addAttribute("newCamp", new MidRangeCampsEntity());
        return "facecamps/mid-range/admin";
    }

    @PostMapping("/admin")
    public String addCampFromForm(@ModelAttribute MidRangeCampsEntity newCamp) {
        midRangeRepository.save(newCamp);
        return "redirect:/mcamps/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteCampFromForm(@PathVariable Long id) {
        midRangeRepository.deleteById(id);
        return "redirect:/mcamps/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<MidRangeCampsEntity> camp = midRangeRepository.findById(id);
        if (camp.isEmpty()) return "redirect:/mcamps/admin";
        model.addAttribute("camp", camp.get());
        return "facecamps/mid-range/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateCamp(@PathVariable Long id, @ModelAttribute MidRangeCampsEntity updatedCamp) {
        Optional<MidRangeCampsEntity> camp = midRangeRepository.findById(id);
        if (camp.isPresent()) {
            MidRangeCampsEntity c = camp.get();
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
            midRangeRepository.save(c);
        }
        return "redirect:/mcamps/admin";
    }

    @GetMapping("/all")
    public String allCamps(Model model) {
        model.addAttribute("camps", midRangeRepository.findAll());
        return "facecamps/mid-range/all";
    }
}