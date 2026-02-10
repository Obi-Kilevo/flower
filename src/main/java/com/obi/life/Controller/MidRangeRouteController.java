package com.obi.life.Controller;

import com.obi.life.Entity.MidRangeRouteEntity;
import com.obi.life.Repository.MidRangeRouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/mroutes")
public class MidRangeRouteController {

    @Autowired
    private MidRangeRouteRepository midRangeRouteRepository;

    // =================== USER SIDE ===================
    @GetMapping("/all")
    public String allMidRangeRoutes(Model model) {
        List<MidRangeRouteEntity> allRoutes = midRangeRouteRepository.findAll();
        model.addAttribute("midRangeRoutes", allRoutes);
        return "routes/midrange/all";
    }

    // =================== ADMIN SIDE ===================
    @GetMapping("/admin")
    public String adminMidRangeRoutes(Model model) {
        model.addAttribute("routes", midRangeRouteRepository.findAll());
        model.addAttribute("newRoute", new MidRangeRouteEntity());
        return "routes/midrange/admin";
    }

    @PostMapping("/admin")
    public String addRoute(@ModelAttribute MidRangeRouteEntity newRoute) {
        newRoute.setCreatedAt(LocalDateTime.now());
        newRoute.setUpdatedAt(LocalDateTime.now());

        if (newRoute.getFormPath() == null || newRoute.getFormPath().isEmpty()) {
            newRoute.setFormPath("default");
        }

        midRangeRouteRepository.save(newRoute);
        return "redirect:/mroutes/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteRoute(@PathVariable Long id) {
        midRangeRouteRepository.deleteById(id);
        return "redirect:/mroutes/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String editRoute(@PathVariable Long id, Model model) {
        Optional<MidRangeRouteEntity> route = midRangeRouteRepository.findById(id);
        if (route.isEmpty()) {
            return "redirect:/mroutes/admin";
        }
        model.addAttribute("route", route.get());
        return "routes/midrange/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateRoute(
            @PathVariable Long id,
            @ModelAttribute MidRangeRouteEntity updatedRoute
    ) {
        Optional<MidRangeRouteEntity> routeOpt = midRangeRouteRepository.findById(id);
        if (routeOpt.isPresent()) {
            MidRangeRouteEntity r = routeOpt.get();

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

            midRangeRouteRepository.save(r);
        }
        return "redirect:/mroutes/admin";
    }

    @PostMapping("/admin/toggle/{id}")
    public String toggleStatus(@PathVariable Long id) {
        Optional<MidRangeRouteEntity> routeOpt = midRangeRouteRepository.findById(id);
        if (routeOpt.isPresent()) {
            MidRangeRouteEntity route = routeOpt.get();
            route.setStatus(route.getStatus().equals("available") ? "unavailable" : "available");
            route.setUpdatedAt(LocalDateTime.now());
            midRangeRouteRepository.save(route);
        }
        return "redirect:/mroutes/admin";
    }

    @GetMapping("/{routeNumber}")
    public String routeDetails(@PathVariable String routeNumber, Model model) {
        List<MidRangeRouteEntity> allRoutes = midRangeRouteRepository.findAll();

        Optional<MidRangeRouteEntity> route = allRoutes.stream()
                .filter(r -> routeNumber.equalsIgnoreCase(r.getFormPath()))
                .findFirst();

        if (route.isPresent()) {
            model.addAttribute("route", route.get());
            return "routes/midrange/routespath/" + route.get().getFormPath();
        }

        return "redirect:/mroutes/all";
    }
}