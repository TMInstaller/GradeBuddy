package ac.tukorea.gradebuddy.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/") // 1. 만약 내가 http://localhost:8080/ 에 위치해 있다면 아래 함수를 실행합니다.
    public String mainPage() {
        return "main_page"; // 2. main_page.jsp 파일을 반환합니다. views 폴더에 있는 파일을 반환합니다.
    }
}