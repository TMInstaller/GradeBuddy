// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String profilePage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user"); // 세션에서 사용자 정보를 가져옵니다.
        if (user != null) {
            model.addAttribute("user", user); // 사용자 정보를 Model에 추가합니다.
        }
        return "users/users_profile"; // 사용자 정보를 보여줄 페이지를 반환합니다.
    }

    @GetMapping("/users/check_password")
    public String checkPasswordPage() {
        return "users/users_check_password";
    }

    @PostMapping("/checkPassword")
    public String checkPassword(HttpSession session, @RequestParam String password, Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getPassword().equals(password)) {
            return "redirect:/users/edit_profile"; // 비밀번호가 일치하면 프로필 편집 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "users/users_password_check"; // 비밀번호가 일치하지 않으면 에러 메시지를 보여주고 다시 비밀번호 확인 페이지로 이동
        }
    }

    @GetMapping("/users/edit_profile")
    public String editProfilePage() {
        return "users/users_edit_profile";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(HttpSession session, @RequestParam String email, @RequestParam String username, Model model) {
        User user = (User) session.getAttribute("user");
        user.setUser_id(user.getUser_id());
        user.setEmail(email);
        user.setUsername(username);
        userService.updateUser(user); // 사용자 정보를 업데이트하는 메소드를 구현해야 합니다.
        model.addAttribute("success", "프로필이 성공적으로 업데이트되었습니다.");
        return "users/users_profile";
    }

}
