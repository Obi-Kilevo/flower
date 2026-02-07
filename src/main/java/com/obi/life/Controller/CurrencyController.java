package com.obi.life.Controller;

import com.obi.life.Entity.CurrencyEntity;
import com.obi.life.Repository.CurrencyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/money")
public class CurrencyController {

    @Autowired
    private CurrencyRepository currencyRepository;

    // =================== ADMIN ONLY ===================
    @GetMapping("/admin")
    public String adminCurrency(Model model) {
        model.addAttribute("currencies", currencyRepository.findAll());
        model.addAttribute("newCurrency", new CurrencyEntity());
        return "currency/admin";
    }

    @PostMapping("/admin")
    public String addCurrencyFromForm(@ModelAttribute CurrencyEntity newCurrency) {
        currencyRepository.save(newCurrency);
        return "redirect:/money/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteCurrencyFromForm(@PathVariable Long id) {
        currencyRepository.deleteById(id);
        return "redirect:/money/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<CurrencyEntity> currency = currencyRepository.findById(id);
        if (currency.isEmpty()) return "redirect:/money/admin";
        model.addAttribute("currency", currency.get());
        return "currency/edit";
    }

    @PostMapping("/admin/update/{id}")
    public String updateCurrency(@PathVariable Long id, @ModelAttribute CurrencyEntity updatedCurrency) {
        Optional<CurrencyEntity> currency = currencyRepository.findById(id);
        if (currency.isPresent()) {
            CurrencyEntity c = currency.get();
            c.setName(updatedCurrency.getName());
            c.setCode(updatedCurrency.getCode());
            c.setRate(updatedCurrency.getRate());
            c.setSymbol(updatedCurrency.getSymbol());
            c.setDescription(updatedCurrency.getDescription());
            c.setImageUrl(updatedCurrency.getImageUrl());
            c.setUpdatedAt(LocalDateTime.now());
            currencyRepository.save(c);
        }
        return "redirect:/money/admin";
    }

    @GetMapping("/all")
    public String allCurrencies(Model model) {
        model.addAttribute("currencies", currencyRepository.findAll());
        return "currency/all";
    }
}