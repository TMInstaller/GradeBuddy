// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/users/login")
    public String loginPage() {
        return "users/users_login";
    }

    @PostMapping("/loginProcess")
    public String loginProcess(HttpServletRequest request, HttpSession session) {
        // 로그인 관련 프로세스
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 이메일과 비밀번호로 사용자 정보를 조회합니다.
        User user = userService.findUserByEmailAndPassword(email, password);

        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/";
        } else {
            // 로그인 실패
            return "redirect:/users/login";
        }
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
