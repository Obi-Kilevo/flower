package com.obi.life.Controller;

import com.obi.life.Entity.MidRangeLodgesEntity;
import com.obi.life.Repository.MidRangeLodgesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/mlodges")
public class MidRangeLodgesController {

    @Autowired
    private MidRangeLodgesRepository midRangeLodgesRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminLodges(Model model) {
        model.addAttribute("lodges", midRangeLodgesRepository.findAll());
        model.addAttribute("newLodge", new MidRangeLodgesEntity());
        return "facelodges/mid-range/admin";
    }

    @PostMapping("/admin")
    public String addLodgeFromForm(@ModelAttribute MidRangeLodgesEntity newLodge) {
        midRangeLodgesRepository.save(newLodge);
        return "redirect:/mlodges/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteLodgeFromForm(@PathVariable Long id) {
        midRangeLodgesRepository.deleteById(id);
        return "redirect:/mlodges/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<MidRangeLodgesEntity> lodge = midRangeLodgesRepository.findById(id);
        if (lodge.isEmpty()) return "redirect:/mlodges/admin";
        model.addAttribute("lodge", lodge.get());
        return "facelodges/mid-range/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateLodge(@PathVariable Long id, @ModelAttribute MidRangeLodgesEntity updatedLodge) {
        Optional<MidRangeLodgesEntity> lodge = midRangeLodgesRepository.findById(id);
        if (lodge.isPresent()) {
            MidRangeLodgesEntity l = lodge.get();
            l.setName(updatedLodge.getName());
            l.setCity(updatedLodge.getCity());
            l.setCountry(updatedLodge.getCountry());
            l.setAddress(updatedLodge.getAddress());
            l.setPrice(updatedLodge.getPrice());
            l.setCurrency(updatedLodge.getCurrency());
            l.setImageUrl(updatedLodge.getImageUrl());
            l.setFeatures(updatedLodge.getFeatures());
            l.setFormPath(updatedLodge.getFormPath());
            l.setUpdatedAt(LocalDateTime.now());
            midRangeLodgesRepository.save(l);
        }
        return "redirect:/mlodges/admin";
    }

    @GetMapping("/all")
    public String allLodges(Model model) {
        model.addAttribute("lodges", midRangeLodgesRepository.findAll());
        return "facelodges/mid-range/all";
    }
}