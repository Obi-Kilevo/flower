package com.obi.life.Controller;

import com.obi.life.Entity.FaceLodgesEntity;
import com.obi.life.Repository.FaceLodgesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/flodges")
public class FaceLodgesController {

    @Autowired
    private FaceLodgesRepository faceLodgesRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminLodges(Model model) {
        model.addAttribute("lodges", faceLodgesRepository.findAll());
        model.addAttribute("newLodge", new FaceLodgesEntity());
        return "facelodges/admin";
    }

    @PostMapping("/admin")
    public String addLodgeFromForm(@ModelAttribute FaceLodgesEntity newLodge) {
        faceLodgesRepository.save(newLodge);
        return "redirect:/flodges/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteLodgeFromForm(@PathVariable Long id) {
        faceLodgesRepository.deleteById(id);
        return "redirect:/flodges/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<FaceLodgesEntity> lodge = faceLodgesRepository.findById(id);
        if (lodge.isEmpty()) return "redirect:/flodges/admin";
        model.addAttribute("lodge", lodge.get());
        return "facelodges/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateLodge(@PathVariable Long id, @ModelAttribute FaceLodgesEntity updatedLodge) {
        Optional<FaceLodgesEntity> lodge = faceLodgesRepository.findById(id);
        if (lodge.isPresent()) {
            FaceLodgesEntity l = lodge.get();
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
            faceLodgesRepository.save(l);
        }
        return "redirect:/flodges/admin";
    }

//    @GetMapping("/all")
//    public String allLodges(Model model) {
//        model.addAttribute("lodges", faceLodgesRepository.findAll());
//        return "facelodges/all";
//    }
}