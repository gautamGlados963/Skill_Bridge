package com.example.Skill_bridge.Controller;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.Skill_bridge.model.User;
import com.example.Skill_bridge.service.FirebaseService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    private FirebaseService firebaseService;

    @GetMapping("/")
    public String signin() {
        return "signin";
    }

    @GetMapping("/signup")
    public String signup() {
        return "signup";
    }

    @GetMapping("/passwordreset")
    public String forgetpass() {
        return "forgetpass";
    }
    
    @GetMapping("/homeadmin")
    public String homeadmin(Model model) {
        try {
            long totalStudents = firebaseService.countUsersByDomain("student");
            long totalMentors = firebaseService.countUsersByDomain("professor");

            model.addAttribute("totalStudents", totalStudents);
            model.addAttribute("totalMentors", totalMentors);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Unable to fetch user counts.");
        }
        return "homeadmin";
    }



    @GetMapping("/homestudent")
    public String homestudent(HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/"; // Redirect to login if session is not valid
        }
        return "homepage";
    }

    @GetMapping("/homeprof")
    public String homeprof(HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/"; // Redirect to login if session is not valid
        }
        return "homeprof";
    }

    @GetMapping("/studentprofile")
    public String studentprofile(Model model, HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/"; // Redirect to login if session is not valid
        }

        User currentUser = (User) session.getAttribute("u");
        model.addAttribute("Username", currentUser.getName());
        return "/studentprofile";
    }

    @GetMapping("/mentorprofile")
    public String mentorProfile(HttpSession session) {
        User u = (User) session.getAttribute("u");
        if (u == null || !"mentor".equalsIgnoreCase(u.getDomain())) {
            return "redirect:/"; // Redirect to login or error page if unauthorized
        }
        return "mentorprofile"; // Render mentor profile page
    }


    @GetMapping("/mentors")
    public String mentors(HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/"; // Redirect to login if session is not valid
        }
        return "/mentors";
    }

    @GetMapping("/students")
    public String students(HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/"; // Redirect to login if session is not valid
        }
        return "/students";
    }

    @GetMapping("/adminprofile")
    public String adminprofile(HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/"; // Redirect to login if session is not valid
        }
        return "/adminprofile";
    }

    @PostMapping("/signup")
    public ModelAndView signup(@RequestParam String name, @RequestParam String mobile, @RequestParam String email,
                               @RequestParam String password, @RequestParam String confirmPassword, @RequestParam String domain,
                               @RequestParam(required = false) String address1, @RequestParam(required = false) String address2,
                               @RequestParam(required = false) String postcode, @RequestParam(required = false) String state,
                               @RequestParam(required = false) String city, @RequestParam(required = false) String education,
                               @RequestParam(required = false) String country,
                               @RequestParam(required = false) MultipartFile profilePicture) {
        try {
            // Validate the password confirmation logic
            if (!password.equals(confirmPassword)) {
                ModelAndView modelAndView = new ModelAndView("signup");
                modelAndView.addObject("error", "Passwords do not match");
                return modelAndView;
            }

            // Create the user object and save it using FirebaseService
            User user = new User(name, mobile, email, password, domain, country, address1, address2, postcode, state,
                    city, education);

            if (profilePicture != null && !profilePicture.isEmpty()) {
                String profilePictureUrl = firebaseService.uploadProfilePicture(email, profilePicture);
                user.setProfilePictureUrl(profilePictureUrl);
            }

            String response = firebaseService.saveUser(user);

            ModelAndView modelAndView = new ModelAndView("redirect:/");
            return modelAndView;

        } catch (Exception e) {
            ModelAndView modelAndView = new ModelAndView("signup");
            modelAndView.addObject("error", "Error: " + e.getMessage());
            return modelAndView;
        }
    }

    @PostMapping("/")
    public ModelAndView signin(@RequestParam String email, @RequestParam String password, @RequestParam String domain,
                               HttpSession session, HttpServletResponse response) {
        try {
            User user = firebaseService.validateUser(email, password, domain);
            ModelAndView modelAndView = new ModelAndView();

            if (user != null) {
                session.setAttribute("u", user);

                if ("student".equalsIgnoreCase(domain)) {
                    modelAndView.setViewName("redirect:/homestudent");
                } else if ("professor".equalsIgnoreCase(domain)) {
                    modelAndView.setViewName("redirect:/homeprof");
                } else if ("sdkmentor".equalsIgnoreCase(domain)) {
                    modelAndView.setViewName("redirect:/homeadmin");
                } else {
                    modelAndView.setViewName("redirect:/");
                }
            } else {
                modelAndView.setViewName("redirect:/");
            }
            
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            return modelAndView;
        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("redirect:/");
        }
    }

    // Method to check if user is logged in by session
    private boolean isUserLoggedIn(HttpSession session) {
        return session.getAttribute("u") != null;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the session to log out the user
        return "redirect:/"; // Redirect to the login page after logging out
    }

    @PostMapping("/updateProfile")
    public String updateProfile(@RequestParam(required = false) String name, @RequestParam(required = false) String mobile,
                                @RequestParam(required = false) String address1, @RequestParam(required = false) String address2,
                                @RequestParam(required = false) String postcode, @RequestParam(required = false) String state,
                                @RequestParam(required = false) String city, @RequestParam(required = false) String education,
                                @RequestParam(required = false) String country, @RequestParam(required = false) String email,
                                @RequestParam(required = false) MultipartFile profilePicture, HttpSession session) {

        if (!isUserLoggedIn(session)) {
            return "redirect:/signin";
        }

        User currentUser = (User) session.getAttribute("u");
        updateUserFields(currentUser, name, mobile, address1, address2, postcode, state, city, education, country, email);

        if (profilePicture != null && !profilePicture.isEmpty()) {
            try {
                String profilePictureUrl = firebaseService.uploadProfilePicture(currentUser.getEmail(), profilePicture);
                currentUser.setProfilePictureUrl(profilePictureUrl);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        try {
            firebaseService.updateUser(currentUser);
            session.setAttribute("u", currentUser);
            return "redirect:/studentprofile";
        } catch (Exception e) {
            System.err.println("Profile update error: " + e.getMessage());
            return "redirect:/studentprofile?error=updatefailed";
        }
    }

    private void updateUserFields(User user, String name, String mobile, String address1, String address2, String postcode,
                                  String state, String city, String education, String country, String email) {
        if (name != null) user.setName(name);
        if (mobile != null) user.setMobile(mobile);
        if (address1 != null) user.setAddress1(address1);
        if (address2 != null) user.setAddress2(address2);
        if (postcode != null) user.setPostcode(postcode);
        if (state != null) user.setState(state);
        if (city != null) user.setCity(city);
        if (education != null) user.setEducation(education);
        if (country != null) user.setCountry(country);
        if (email != null) user.setEmail(email);
    }
    
    @GetMapping("/protectedPage")
    public String protectedPage(HttpServletResponse response) {
        // Prevent caching to avoid going back to a cached version of the page after logout
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        return "protectedPage";  // Render the page
    }

}
