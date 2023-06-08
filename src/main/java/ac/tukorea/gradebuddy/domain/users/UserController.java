// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

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

    @GetMapping("/logoutProcess")
    public String logoutProcess(HttpSession session) {
        session.invalidate();  // 세션을 무효화합니다.
        return "redirect:/";  // 홈 페이지로 리다이렉트합니다.
    }

    @GetMapping("/users/register")
    public String registerPage() {
        return "users/users_register";
    }

    @PostMapping("/checkEmail")
    public ResponseEntity<Map<String, Boolean>> checkEmail(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        boolean exists = (userService.findUserByEmail(email) != null);
        return ResponseEntity.ok(Map.of("exists", exists));
    }

    @PostMapping("/registerProcess")
    public String registerProcess(@ModelAttribute User user) {
        // 이미 존재하는 이메일인지 체크
        if (userService.findUserByEmail(user.getEmail()) != null) {
            // 이미 존재하는 이메일인 경우 에러 처리를 하고 다시 회원 가입 페이지로 리다이렉트
            return "redirect:/users/register?error=true";
        }

        // 새로운 사용자를 데이터베이스에 추가
        userService.createUser(user);

        // 회원 가입 성공 후, 홈 페이지로 리다이렉트
        return "redirect:/";
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
