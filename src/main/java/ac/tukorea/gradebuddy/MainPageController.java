package ac.tukorea.gradebuddy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPageController {
    @GetMapping("/") // 1. 슬래시(/) 뒤에 있는 URL에 있다면
    public String hello() {
        return "main_page"; // 2. main_page.jsp 파일을 반환합니다.
    }
}