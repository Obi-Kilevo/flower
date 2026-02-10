package com.obi.life.Controller;

import com.obi.life.Entity.LuxuryRoutesEntity;
import com.obi.life.Repository.LuxuryRoutesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/lroutes")
public class LuxuryRoutesController {

    @Autowired
    private LuxuryRoutesRepository luxuryRoutesRepository;

    // =================== USER SIDE ===================
    @GetMapping("/all")
    public String allLuxuryRoutes(Model model) {
        List<LuxuryRoutesEntity> allRoutes = luxuryRoutesRepository.findAll();
        model.addAttribute("luxuryRoutes", allRoutes);
        return "routes/luxury/all";
    }

    // =================== ADMIN SIDE ===================
    @GetMapping("/admin")
    public String adminLuxuryRoutes(Model model) {
        model.addAttribute("routes", luxuryRoutesRepository.findAll());
        model.addAttribute("newRoute", new LuxuryRoutesEntity());
        return "routes/luxury/admin";
    }


    @PostMapping("/admin")
    public String addRoute(@ModelAttribute LuxuryRoutesEntity newRoute) {
        newRoute.setCreatedAt(LocalDateTime.now());
        newRoute.setUpdatedAt(LocalDateTime.now());

        // Ensure formPath has a default if not provided
        if (newRoute.getFormPath() == null || newRoute.getFormPath().isEmpty()) {
            newRoute.setFormPath("default"); // or generate a number
        }

        luxuryRoutesRepository.save(newRoute);
        return "redirect:/lroutes/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteRoute(@PathVariable Long id) {
        luxuryRoutesRepository.deleteById(id);
        return "redirect:/lroutes/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String editRoute(@PathVariable Long id, Model model) {
        Optional<LuxuryRoutesEntity> route = luxuryRoutesRepository.findById(id);
        if (route.isEmpty()) {
            return "redirect:/lroutes/admin";
        }
        model.addAttribute("route", route.get());
        return "routes/luxury/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateRoute(
            @PathVariable Long id,
            @ModelAttribute LuxuryRoutesEntity updatedRoute
    ) {
        Optional<LuxuryRoutesEntity> routeOpt = luxuryRoutesRepository.findById(id);
        if (routeOpt.isPresent()) {
            LuxuryRoutesEntity r = routeOpt.get();

            r.setParkName(updatedRoute.getParkName());
            r.setRouteName(updatedRoute.getRouteName());
            r.setDescription(updatedRoute.getDescription());
            r.setPrice(updatedRoute.getPrice());
            r.setShowPrice(updatedRoute.getShowPrice());
            r.setStatus(updatedRoute.getStatus());
            r.setImageUrl(updatedRoute.getImageUrl());

            r.setFormPath(updatedRoute.getFormPath());
            r.setDescAdventureType(updatedRoute.getDescAdventureType());
            r.setDescDuration(updatedRoute.getDescDuration());
            r.setDescMeals(updatedRoute.getDescMeals());
            r.setDescAccommodation(updatedRoute.getDescAccommodation());
            r.setDescActivities(updatedRoute.getDescActivities());
            r.setDescTransport(updatedRoute.getDescTransport());

            r.setUpdatedAt(LocalDateTime.now());

            luxuryRoutesRepository.save(r);
        }
        return "redirect:/lroutes/admin";
    }


    @PostMapping("/admin/toggle/{id}")
    public String toggleStatus(@PathVariable Long id) {
        Optional<LuxuryRoutesEntity> routeOpt = luxuryRoutesRepository.findById(id);
        if (routeOpt.isPresent()) {
            LuxuryRoutesEntity route = routeOpt.get();
            route.setStatus(route.getStatus().equals("available") ? "unavailable" : "available");
            route.setUpdatedAt(LocalDateTime.now());
            luxuryRoutesRepository.save(route);
        }
        return "redirect:/lroutes/admin";
    }


    @GetMapping("/{routeNumber}")
    public String routeDetails(@PathVariable String routeNumber, Model model) {
        List<LuxuryRoutesEntity> allRoutes = luxuryRoutesRepository.findAll();

        // Find route by formPath (which should contain the HTML file number)
        Optional<LuxuryRoutesEntity> route = allRoutes.stream()
                .filter(r -> routeNumber.equalsIgnoreCase(r.getFormPath()))
                .findFirst();

        if (route.isPresent()) {
            model.addAttribute("route", route.get());

            // Redirect to static HTML file based on formPath
            // formPath should be like "1", "2", "12" etc.
            return "routes/luxury/routespath/" + route.get().getFormPath();
        }

        return "redirect:/lroutes/all";
    }
}