package vn.hoidanit.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

  private final UserService userService;

  public UserController(
      UserService userService) {
    this.userService = userService;
  }

  @GetMapping("/")
  public String getHomePage(Model model) {
    List<User> arrUsers = this.userService.getAllUsersByEmail("1@gmail.com");
    System.out.println(arrUsers);

    model.addAttribute("eric", "test");
    model.addAttribute("hoidanit", "from controller with model");
    return "hello";
  }

  @GetMapping("/admin/user")
  public String getUserPage(Model model) {
    List<User> users = this.userService.getAllUsers();
    model.addAttribute("users", users);
    return "admin/user/table-user";
  }

  @GetMapping("/admin/user/create") // GET
  public String getCreateUserPage(Model model) {
    model.addAttribute("newUser", new User());
    return "admin/user/create";
  }

  @PostMapping("/admin/user/create")
  public String createUserPage(Model model, @ModelAttribute("newUser") User user) {
    this.userService.handleSaveUser(user);
    return "redirect:/admin/user";
  }

  @GetMapping("/admin/user/view/{userId}")
  public String getUserDetailPage(@PathVariable Long userId, Model model) {
    User user = this.userService.getUserById(userId);
    model.addAttribute("user", user);
    return "admin/user/show";
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