package com.obi.life.Controller;

import com.obi.life.Entity.UfaceEntity;
import com.obi.life.Repository.UfaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/three")
public class UfaceController {

    @Autowired
    private UfaceRepository ufaceRepository;

    // =================== ADMIN ONLY ===================



    @GetMapping("/park/{id}")
    public String showAllParksFromFace(@PathVariable Long id, Model model) {
        // Get the Uface entry from DB
        Optional<UfaceEntity> faceOpt = ufaceRepository.findById(id);
        if (faceOpt.isEmpty()) {
            return "redirect:/parks/all"; // Fallback
        }

        UfaceEntity face = faceOpt.get();
        // Use formPath from DB (e.g., /mountain/all for ID=4)
        String formPath = face.getFormPath();
        if (formPath != null && !formPath.isEmpty()) {
            // Ensure path starts with / (absolute)
            if (!formPath.startsWith("/")) {
                formPath = "/" + formPath;
            }
            return "redirect:" + formPath;
        }

        // Fallback if no formPath
        return "redirect:/parks/all";
    }

    @GetMapping("/explore/{id}")
    public String exploreAllParks(@PathVariable Long id) {
        return "redirect:/parks/all";
    }

    @GetMapping("/admin")
    public String adminUface(Model model) {
        model.addAttribute("faces", ufaceRepository.findAll());
        model.addAttribute("newFace", new UfaceEntity());
        return "face/admin";
    }

    @PostMapping("/admin")
    public String addFaceFromForm(@ModelAttribute UfaceEntity newFace) {
        ufaceRepository.save(newFace);
        return "redirect:/three/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteFaceFromForm(@PathVariable Long id) {
        ufaceRepository.deleteById(id);
        return "redirect:/three/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<UfaceEntity> face = ufaceRepository.findById(id);
        if (face.isEmpty()) return "redirect:/three/admin";
        model.addAttribute("face", face.get());
        return "face/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateFace(@PathVariable Long id, @ModelAttribute UfaceEntity updatedFace) {
        Optional<UfaceEntity> face = ufaceRepository.findById(id);
        if (face.isPresent()) {
            UfaceEntity f = face.get();
            f.setParkName(updatedFace.getParkName());
            f.setAbout(updatedFace.getAbout());
            f.setDescription(updatedFace.getDescription());
            f.setImageUrl(updatedFace.getImageUrl());
            f.setVisitTime(updatedFace.getVisitTime());
            f.setAnimalNumber(updatedFace.getAnimalNumber());
            f.setFormPath(updatedFace.getFormPath());
            f.setUpdatedAt(LocalDateTime.now());
            ufaceRepository.save(f);
        }
        return "redirect:/three/admin";
    }

    @GetMapping("/face")
    public String allfacesareHer() {
        return "face/userfaces/allFaces";
    }

}