package com.obi.life.Controller;

import com.obi.life.Entity.FaceRouteEntity;
import com.obi.life.Repository.FaceRouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/faceroute")
public class FaceRouteController {

    @Autowired
    private FaceRouteRepository faceRouteRepository;

    // =================== USER SIDE ===================

    @GetMapping("/route/{id}")
    public String redirectToRoute(@PathVariable Long id) {
        Optional<FaceRouteEntity> routeOpt = faceRouteRepository.findById(id);
        if (routeOpt.isEmpty()) {
            return "redirect:/";
        }
        return "face/userfaces/routeface/routeface";
    }

    // =================== ADMIN SIDE ===================

    @GetMapping("/admin")
    public String adminFaceRoute(Model model) {
        model.addAttribute("routes", faceRouteRepository.findAll());
        model.addAttribute("newRoute", new FaceRouteEntity());
        return "face/userfaces/routeface/admin";
    }

    @PostMapping("/admin")
    public String addRoute(@ModelAttribute FaceRouteEntity newRoute) {
        newRoute.setCreatedAt(LocalDateTime.now());
        newRoute.setUpdatedAt(LocalDateTime.now());
        faceRouteRepository.save(newRoute);
        return "redirect:/faceroute/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteRoute(@PathVariable Long id) {
        faceRouteRepository.deleteById(id);
        return "redirect:/faceroute/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String editRoute(@PathVariable Long id, Model model) {
        Optional<FaceRouteEntity> route = faceRouteRepository.findById(id);
        if (route.isEmpty()) {
            return "redirect:/faceroute/admin";
        }
        model.addAttribute("route", route.get());
        return "face/userfaces/routeface/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateRoute(
            @PathVariable Long id,
            @ModelAttribute FaceRouteEntity updatedRoute
    ) {
        Optional<FaceRouteEntity> routeOpt = faceRouteRepository.findById(id);
        if (routeOpt.isPresent()) {
            FaceRouteEntity r = routeOpt.get();

            r.setParkName(updatedRoute.getParkName());
            r.setRouteName(updatedRoute.getRouteName());
            r.setDescription(updatedRoute.getDescription());
            r.setPrice(updatedRoute.getPrice());
            r.setShowPrice(updatedRoute.getShowPrice());
            r.setStatus(updatedRoute.getStatus());
            r.setImageUrl(updatedRoute.getImageUrl());

            r.setDescAdventureType(updatedRoute.getDescAdventureType());
            r.setDescDuration(updatedRoute.getDescDuration());
            r.setDescMeals(updatedRoute.getDescMeals());
            r.setDescAccommodation(updatedRoute.getDescAccommodation());
            r.setDescActivities(updatedRoute.getDescActivities());
            r.setDescTransport(updatedRoute.getDescTransport());

            r.setUpdatedAt(LocalDateTime.now());

            faceRouteRepository.save(r);
        }
        return "redirect:/faceroute/admin";
    }



    @GetMapping("/all")
    public String allLuxuryRoutes(Model model) {
        model.addAttribute("faceroute", faceRouteRepository.findAll());
        return "routes/luxury/all";
    }

}
