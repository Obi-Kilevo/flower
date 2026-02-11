package com.obi.life.Controller;

import com.obi.life.Entity.*;
import com.obi.life.Repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/parks")
public class NationalParksController {

    @Autowired
    private NationalParksRepository nationalParksRepository;

//    @Autowired
//    private RoutesRepository routesRepository;


    @Autowired
    private LuxuryHotelsRepository luxuryHotelsRepository;


//    @Autowired
//    private CampRepository campRepository;



    @Autowired
    private LuxuryLodgesRepository lodgeRepository;


    @Autowired
    private MountainsRepository  mountainsRepository;

    @Autowired
    private UfaceRepository  ufaceRepository;

    @Autowired
    private FaceRouteRepository faceRouteRepository;

    @Autowired
    private FaceHotelsRepository faceHotelRepository;


    @Autowired
    private FaceCampsRepository faceCampsRepository;





    @Autowired
    private MountainsRepository  mountainRepository;

    @Autowired
    private CurrencyRepository  currencyRepository;
    @Autowired
    private FaceLodgesRepository faceLodgesRepository;


    // =================== JSON API ===================
    @GetMapping("/api")
    @ResponseBody
    public List<NationalParksEntity> getAllParks() {
        return nationalParksRepository.findAll().stream()
                .filter(p -> "available".equals(p.getStatus()))
                .toList();
    }

    @GetMapping("/api/park/{parkName}")
    @ResponseBody
    public List<NationalParksEntity> getParksByName(@PathVariable String parkName) {
        return nationalParksRepository.findAll().stream()
                .filter(p -> p.getParkName().equalsIgnoreCase(parkName) && "available".equals(p.getStatus()))
                .toList();
    }

    @PostMapping("/api")
    @ResponseBody
    public NationalParksEntity addPark(@RequestBody NationalParksEntity park) {
        return nationalParksRepository.save(park);
    }

    @PutMapping("/api/{id}")
    @ResponseBody
    public NationalParksEntity updatePark(@PathVariable Long id, @RequestBody NationalParksEntity parkDetails) {
        Optional<NationalParksEntity> optionalPark = nationalParksRepository.findById(id);
        if (optionalPark.isEmpty()) return null;

        NationalParksEntity park = optionalPark.get();
        if (parkDetails.getParkName() != null) park.setParkName(parkDetails.getParkName());
        if (parkDetails.getRouteName() != null) park.setRouteName(parkDetails.getRouteName());
        if (parkDetails.getDescription() != null) park.setDescription(parkDetails.getDescription());
        if (parkDetails.getPrice() != null) park.setPrice(parkDetails.getPrice());
        if (parkDetails.getShowPrice() != null) park.setShowPrice(parkDetails.getShowPrice());
        if (parkDetails.getStatus() != null) park.setStatus(parkDetails.getStatus());
        if (parkDetails.getVisitTime() != null) park.setVisitTime(parkDetails.getVisitTime());
        if (parkDetails.getAnimalNumber() != null) park.setAnimalNumber(parkDetails.getAnimalNumber());

        park.setUpdatedAt(LocalDateTime.now());
        return nationalParksRepository.save(park);
    }



    @DeleteMapping("/api/{id}")
    @ResponseBody
    public String deletePark(@PathVariable Long id) {
        nationalParksRepository.deleteById(id);
        return "Park deleted successfully";
    }

    // =================== HTML PAGES ===================
    @GetMapping("/user")
    public String userParks(Model model) {
        List<NationalParksEntity> parks = nationalParksRepository.findAll().stream()
                .filter(p -> "available".equals(p.getStatus()))
                .limit(0)
                .toList();
        model.addAttribute("parks", parks);



//        List<LuxuryHotelsEntity> hotels = luxuryHotelsRepository.findAll().stream()
//                .limit(3)  // Show max 4 hotels
//                .toList();
//        model.addAttribute("hotels", hotels);


        List<FaceCampsEntity> camps = faceCampsRepository.findAll().stream()
                .limit(3)  // Show max 3 camps
                .toList();
        model.addAttribute("camps", camps);


        List<FaceLodgesEntity> lodges = faceLodgesRepository.findAll().stream()
                .limit(3)  // Show max 3 lodges
                .toList();
        model.addAttribute("lodges", lodges);


        List<MountainsEntity> mountains = mountainsRepository.findAll().stream()
                .limit(3)  // Show max 3 mountains
                .toList();
        model.addAttribute("mountains", mountains);


        List<UfaceEntity> face = ufaceRepository.findAll().stream()
                .limit(3)
                .toList();
        model.addAttribute("face", face);  // ✅


        List<FaceRouteEntity> faceroute = faceRouteRepository.findAll().stream()
                .limit(3)
                .toList();
        model.addAttribute("faceroute", faceroute);  // ✅


        List<FaceHotelsEntity> facehotels = faceHotelRepository.findAll().stream()
                .limit(3)
                .toList();
        model.addAttribute("hotels", facehotels);


        return "parks/index";
    }



    @GetMapping("/all")
    public String allParks(Model model) {
        // Get ALL available parks
        List<NationalParksEntity> allParks = nationalParksRepository.findAll().stream()
                .filter(p -> "available".equals(p.getStatus()))
                .toList();

        model.addAttribute("remainingParks", allParks);  // ✅ Use ALL parks
        model.addAttribute("totalParks", allParks.size());
        return "parks/all";
    }


    // =================== ADMIN - BOTH PARKS & ROUTES ===================
    @GetMapping("/admin")
    public String adminParks(Model model) {
        model.addAttribute("parks", nationalParksRepository.findAll());
//        model.addAttribute("routes", routesRepository.findAll());
        model.addAttribute("newPark", new NationalParksEntity());
//        model.addAttribute("newRoute", new RoutesEntity());



//        model.addAttribute("descActivities", new RoutesEntity());
        return "parks/admin";
    }

    // === PARK ADMIN METHODS ===
    @PostMapping("/admin")
    public String addParkFromForm(@ModelAttribute NationalParksEntity newPark) {
        nationalParksRepository.save(newPark);
        return "redirect:/parks/admin";
    }

    @PostMapping("/admin/delete/{id}")
    public String deleteParkFromForm(@PathVariable Long id) {
        nationalParksRepository.deleteById(id);
        return "redirect:/parks/admin";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<NationalParksEntity> park = nationalParksRepository.findById(id);
        if (park.isEmpty()) return "redirect:/parks/admin";
        model.addAttribute("park", park.get());
        return "parks/edit";
    }

    @PostMapping("/admin/edit/{id}")
    public String updateParkFromForm(@PathVariable Long id, @ModelAttribute NationalParksEntity updatedPark) {
        Optional<NationalParksEntity> optionalPark = nationalParksRepository.findById(id);
        if (optionalPark.isEmpty()) return "redirect:/parks/admin";

        NationalParksEntity park = optionalPark.get();
        park.setParkName(updatedPark.getParkName());
        park.setRouteName(updatedPark.getRouteName());
        park.setDescription(updatedPark.getDescription());
        park.setPrice(updatedPark.getPrice());
        park.setShowPrice(updatedPark.getShowPrice());
        park.setStatus(updatedPark.getStatus());
        park.setUpdatedAt(LocalDateTime.now());

        park.setVisitTime(updatedPark.getVisitTime());
        park.setAnimalNumber(updatedPark.getAnimalNumber());
        park.setImageUrl(updatedPark.getImageUrl());

        park.setFormPath(updatedPark.getFormPath());  // <-- ADD THIS LINE

        nationalParksRepository.save(park);

        return "redirect:/parks/admin";
    }

    @PostMapping("/admin/toggle/{id}")
    public String toggleParkStatus(@PathVariable Long id) {
        Optional<NationalParksEntity> optionalPark = nationalParksRepository.findById(id);
        if (optionalPark.isPresent()) {
            NationalParksEntity park = optionalPark.get();
            park.setStatus(park.getStatus().equals("available") ? "unavailable" : "available");
            park.setUpdatedAt(LocalDateTime.now());
            nationalParksRepository.save(park);


        }
        return "redirect:/parks/admin";
    }


    // Add this method for separate admin list endpoint
    @GetMapping("/admin/list")
    public String adminParkList(Model model) {
        model.addAttribute("parks", nationalParksRepository.findAll());
        return "parks/admin-list";
    }


    @GetMapping("/{parkName}")
    public String parkDetails(@PathVariable String parkName, Model model) {
        List<NationalParksEntity> allParks = nationalParksRepository.findAll();

        // Search by matching formPath with parkName (not /parks/ + parkName)
        Optional<NationalParksEntity> park = allParks.stream()
                .filter(p -> parkName.equalsIgnoreCase(p.getFormPath()))
                .findFirst();

        if (park.isPresent()) {
            model.addAttribute("park", park.get());
            return "parks/parkspath/" + parkName;
        }

        return "redirect:/parks/all";
    }
}

