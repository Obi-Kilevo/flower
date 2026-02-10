//package com.obi.life.Controller;
//
//import com.obi.life.Entity.FaceCampsEntity;
//import com.obi.life.Repository.FaceCampsRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.time.LocalDateTime;
//import java.util.Optional;
//
//@Controller
//@RequestMapping("/fcamps")
//public class FaceCampsController {
//
//    @Autowired
//    private FaceCampsRepository faceCampsRepository;
//
//
//    @GetMapping("/admin")
//    public String adminFaceCamps(Model model) {
//        model.addAttribute("camps", faceCampsRepository.findAll());
//        model.addAttribute("newCamp", new FaceCampsEntity());
//        return "facecamps/admin";  // Direct in facecamps/
//    }
//
//    @PostMapping("/admin")
//    public String addCamp(@ModelAttribute FaceCampsEntity newCamp) {
//        newCamp.setCreatedAt(LocalDateTime.now());
//        newCamp.setUpdatedAt(LocalDateTime.now());
//        faceCampsRepository.save(newCamp);
//        return "redirect:/fcamps/admin";
//    }
//
//    @PostMapping("/admin/delete/{id}")
//    public String deleteCamp(@PathVariable Long id) {
//        faceCampsRepository.deleteById(id);
//        return "redirect:/fcamps/admin";
//    }
//
//    @GetMapping("/admin/edit/{id}")
//    public String editCamp(@PathVariable Long id, Model model) {
//        Optional<FaceCampsEntity> camp = faceCampsRepository.findById(id);
//        if (camp.isEmpty()) {
//            return "redirect:/fcamps/admin";
//        }
//        model.addAttribute("camp", camp.get());
//        model.addAttribute("newCamp", new FaceCampsEntity());
//        return "facecamps/edit";
//    }
//
//    @PostMapping("/admin/update/{id}")
//    public String updateCamp(
//            @PathVariable Long id,
//            @ModelAttribute FaceCampsEntity updatedCamp
//    ) {
//        Optional<FaceCampsEntity> campOpt = faceCampsRepository.findById(id);
//        if (campOpt.isPresent()) {
//            FaceCampsEntity c = campOpt.get();
//
//            c.setName(updatedCamp.getName());
//            c.setCity(updatedCamp.getCity());
//            c.setCountry(updatedCamp.getCountry());
//            c.setAddress(updatedCamp.getAddress());
//            c.setPrice(updatedCamp.getPrice());
//            c.setCurrency(updatedCamp.getCurrency());
//            c.setFeatures(updatedCamp.getFeatures());
//            c.setImageUrl(updatedCamp.getImageUrl());
//            c.setFormPath(updatedCamp.getFormPath());
//
//            c.setUpdatedAt(LocalDateTime.now());
//
//            faceCampsRepository.save(c);
//        }
//        return "redirect:/fcamps/admin";
//    }
//}

package com.obi.life.Controller;

import com.obi.life.Entity.FaceCampsEntity;
import com.obi.life.Repository.FaceCampsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/fcamps") // Base path (all URLs start with /fcamps)
public class FaceCampsController {

    @Autowired
    private FaceCampsRepository faceCampsRepository;

    // Admin dashboard (works)
    @GetMapping("/admin")
    public String adminFaceCamps(Model model) {
        model.addAttribute("camps", faceCampsRepository.findAll());
        model.addAttribute("newCamp", new FaceCampsEntity());
        return "facecamps/admin"; // Correct path: templates/facecamps/admin.html
    }

    // Add new camp (works)
    @PostMapping("/admin")
    public String addCamp(@ModelAttribute FaceCampsEntity newCamp) {
        newCamp.setCreatedAt(LocalDateTime.now());
        newCamp.setUpdatedAt(LocalDateTime.now());
        faceCampsRepository.save(newCamp);
        return "redirect:/fcamps/admin";
    }

    // Delete camp (works)
    @PostMapping("/admin/delete/{id}")
    public String deleteCamp(@PathVariable Long id) {
        faceCampsRepository.deleteById(id);
        return "redirect:/fcamps/admin";
    }

    // FIX 1: Edit form - removed redundant newCamp, fixed path logic
    @GetMapping("/admin/edit/{id}")
    public String editCamp(@PathVariable Long id, Model model) {
        Optional<FaceCampsEntity> camp = faceCampsRepository.findById(id);
        if (camp.isEmpty()) {
            return "redirect:/fcamps/admin"; // Redirect if camp not found
        }
        model.addAttribute("camp", camp.get()); // Only pass the existing camp (no newCamp)
        return "facecamps/edit"; // Correct path: templates/facecamps/edit.html
    }

    // Update camp (works - path is correct)
    @PostMapping("/admin/update/{id}")
    public String updateCamp(
            @PathVariable Long id,
            @ModelAttribute FaceCampsEntity updatedCamp
    ) {
        Optional<FaceCampsEntity> campOpt = faceCampsRepository.findById(id);
        if (campOpt.isPresent()) {
            FaceCampsEntity c = campOpt.get();

            c.setName(updatedCamp.getName());
            c.setCity(updatedCamp.getCity());
            c.setCountry(updatedCamp.getCountry());
            c.setAddress(updatedCamp.getAddress());
            c.setPrice(updatedCamp.getPrice());
            c.setCurrency(updatedCamp.getCurrency());
            c.setFeatures(updatedCamp.getFeatures());
            c.setImageUrl(updatedCamp.getImageUrl());
            c.setFormPath(updatedCamp.getFormPath());

            c.setUpdatedAt(LocalDateTime.now());

            faceCampsRepository.save(c);
        }
        return "redirect:/fcamps/admin";
    }
}