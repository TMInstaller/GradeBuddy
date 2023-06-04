// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.users;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/users/login")
    public String loginPage() {
        return "users/users_login";
    }

    @GetMapping("/users/logout")
    public String logoutPage() {
        return "users/users_logout";
    }

    @GetMapping("/users/register")
    public String registerPage() {
        return "users/users_register";
    }

    @GetMapping("/users/profile")
    public String profilePage() {
        return "users/users_profile";
    }

    @GetMapping("/users/edit_profile")
    public String editProfilePage() {
        return "users/users_edit_profile";
    }

}
