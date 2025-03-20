package org.codenova.studymate.controller;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.codenova.studymate.model.entity.Avatar;
import org.codenova.studymate.model.entity.User;
import org.codenova.studymate.repository.AvatarRepository;
import org.codenova.studymate.repository.LoginLogRepository;
import org.codenova.studymate.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/auth")
@AllArgsConstructor
public class AuthController {

    private AvatarRepository avatarRepository;
    private UserRepository userRepository;
    private LoginLogRepository loginLogRepository;

    @RequestMapping("/signup")
    public String signupHandle(Model model) {
        List<Avatar> avatars = avatarRepository.findAll();
        model.addAttribute("avatars", avatarRepository.findAll());

        return "auth/signup";
    }

    @RequestMapping("/signup/verify")
    public String signupVerifyHandle(@ModelAttribute @Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {

            return "auth/signup/verify-failed";
        }
        if (userRepository.findById(user.getId()) != null) {
            return "auth/signup/verify-failed";
        }
        System.out.println(user);
        userRepository.create(user);
        return "redirect:/index";
    }


    @RequestMapping("/login")
    public String loginHandle(Model model) {
        return "auth/login";
    }

    @Transactional
    @RequestMapping("/login/verify")
    public String loginVerifyHandle(@RequestParam("id") String id,
                                    @RequestParam("password") String password,
                                    HttpSession session) {

        User user = userRepository.findById(id);

        if (user != null && user.getPassword().equals(password)) {

            userRepository.updateLoginCountByUserId(id);
            loginLogRepository.create(id);
            session.setAttribute("user", user);
            session.setAttribute("userAvatar", avatarRepository.findById(user.getAvatarId()));

            return "redirect:/index";
        }
        return "auth/login/verify-failed";
    }

    @RequestMapping("/logout")
    public String logoutHandle(HttpSession session) {
        // session.removeAttribute("user");
        session.invalidate();
        return "redirect:/index";
    }

}