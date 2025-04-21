package vn.hoidanit.laptopshop.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

  private final UserService userService;
  private final UploadService uploadService;
  private final PasswordEncoder passwordEncoder;

  public UserController(
      UserService userService,
      UploadService uploadService,
      PasswordEncoder passwordEncoder) {
    this.userService = userService;
    this.uploadService = uploadService;
    this.passwordEncoder = passwordEncoder;
  }

  @GetMapping("/admin/user")
  public String getUserPage(Model model) {
    List<User> users = this.userService.getAllUsers();
    model.addAttribute("users", users);
    return "admin/user/show";
  }

  @GetMapping("/admin/user/create") // GET
  public String getCreateUserPage(Model model) {
    model.addAttribute("newUser", new User());
    return "admin/user/create";
  }

  @PostMapping("/admin/user/create")
  public String createUserPage(Model model,
      @ModelAttribute("newUser") User user,
      @RequestParam("avatarFile") MultipartFile file) {

    String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
    String hashPassword = this.passwordEncoder.encode(user.getPassword());
    user.setAvatar(avatar);
    user.setPassword(hashPassword);
    user.setRole(this.userService.getRoleByName(user.getRole().getName()));

    this.userService.handleSaveUser(user);
    return "redirect:/admin/user";
  }

  @GetMapping("/admin/user/{id}")
  public String getUserDetailPage(@PathVariable Long id, Model model) {
    User user = this.userService.getUserById(id);
    model.addAttribute("user", user);
    return "admin/user/detail";
  }

  @GetMapping("/admin/user/update/{userId}")
  public String getUpdateUserPage(@PathVariable Long userId, Model model) {
    User user = this.userService.getUserById(userId);
    model.addAttribute("newUser", user);
    return "admin/user/update";
  }

  @PostMapping("/admin/user/update")
  public String postUpdateUser(@ModelAttribute("newUser") User user) {
    User currentUser = this.userService.getUserById(user.getId());
    if (currentUser != null) {
      currentUser.setAddress(user.getAddress());
      currentUser.setFullName(user.getFullName());
      currentUser.setPhone(user.getPhone());

      this.userService.handleSaveUser(currentUser);
    }
    return "redirect:/admin/user";
  }

  @GetMapping("/admin/user/delete/{userId}")
  public String getDeleteUserPage(@PathVariable Long userId, Model model) {
    model.addAttribute("id", userId);
    model.addAttribute("newUser", new User());
    return "admin/user/delete";
  }

  @PostMapping("/admin/user/delete")
  public String postDeleteUser(@ModelAttribute("newUser") User user) {
    this.userService.deleteAUser(user.getId());
    return "redirect:/admin/user";
  }
}