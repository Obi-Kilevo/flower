package com.obi.life.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    // Add logger to debug
    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @GetMapping("/obi")
    public String adminModel() {
        logger.info("Admin route /admin/obi hit successfully!"); // Log to confirm route is triggered
        return "admin/partOne"; // Remove leading slash (critical for Linux/Render)
    }
}




//package com.obi.life.Controller;
//
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//@RequestMapping("/admin")
//public class AdminController {
//
//
//    @GetMapping("/obi")
//    public String adminModel() {
//        return "/admin/partOne";
//    }
//}
