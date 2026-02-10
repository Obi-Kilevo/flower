package com.obi.life.Controller;

import com.obi.life.Entity.BudgetRoutesEntity;
import com.obi.life.Repository.BudgetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/broutes")
public class BudgetRoutesController {

    @Autowired
    private BudgetRepository budgetRepository;

    // =================== USER SIDE ===================
    @GetMapping("/all")
    public String allBudgetRoutes(Model model) {
        List<BudgetRoutesEntity> allRoutes = budgetRepository.findAll();
        model.addAttribute("budgetRoutes", allRoutes);
        return "routes/budget/all";
    }

    // =================== ADMIN SIDE ===================
    @GetMapping("/admin")
    public String adminBudgetRoutes(Model model) {
        model.addAttribute("routes", budgetRepository.findAll());
        model.addAttribute("newRoute", new BudgetRoutesEntity());
        return "routes/budget/admin";
    }

    @PostMapping("/admin")
    public String addRoute(@ModelAttribute BudgetRoutesEntity newRoute) {
        newRoute.setCreatedAt(LocalDateTime.now());
        newRoute.setUpdatedAt(LocalDateTime.now());

        if (newRoute.getFormPath() == null || newRoute.getFormPath().isEmpty()) {
            newRoute.setFormPath("default");
        }

        budgetRepository.save(newRoute);
        return "redirect:/broutes/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteRoute(@PathVariable Long id) {
        budgetRepository.deleteById(id);
        return "redirect:/broutes/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String editRoute(@PathVariable Long id, Model model) {
        Optional<BudgetRoutesEntity> route = budgetRepository.findById(id);
        if (route.isEmpty()) {
            return "redirect:/broutes/admin";
        }
        model.addAttribute("route", route.get());
        return "routes/budget/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateRoute(
            @PathVariable Long id,
            @ModelAttribute BudgetRoutesEntity updatedRoute
    ) {
        Optional<BudgetRoutesEntity> routeOpt = budgetRepository.findById(id);
        if (routeOpt.isPresent()) {
            BudgetRoutesEntity r = routeOpt.get();

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

            budgetRepository.save(r);
        }
        return "redirect:/broutes/admin";
    }

    @PostMapping("/admin/toggle/{id}")
    public String toggleStatus(@PathVariable Long id) {
        Optional<BudgetRoutesEntity> routeOpt = budgetRepository.findById(id);
        if (routeOpt.isPresent()) {
            BudgetRoutesEntity route = routeOpt.get();
            route.setStatus(route.getStatus().equals("available") ? "unavailable" : "available");
            route.setUpdatedAt(LocalDateTime.now());
            budgetRepository.save(route);
        }
        return "redirect:/broutes/admin";
    }

    @GetMapping("/{routeNumber}")
    public String routeDetails(@PathVariable String routeNumber, Model model) {
        List<BudgetRoutesEntity> allRoutes = budgetRepository.findAll();

        Optional<BudgetRoutesEntity> route = allRoutes.stream()
                .filter(r -> routeNumber.equalsIgnoreCase(r.getFormPath()))
                .findFirst();

        if (route.isPresent()) {
            model.addAttribute("route", route.get());
            return "routes/budget/routespath/" + route.get().getFormPath();
        }

        return "redirect:/broutes/all";
    }
}