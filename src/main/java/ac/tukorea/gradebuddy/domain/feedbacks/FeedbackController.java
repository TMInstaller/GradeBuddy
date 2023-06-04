// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.feedbacks;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FeedbackController {

    @GetMapping("/feedbacks/list")
    public String feedbackListPage() {
        return "feedbacks/feedbacks_list";
    }

    @GetMapping("/feedbacks/detail")
    public String feedbackDetailPage() {
        return "feedbacks/feedbacks_detail";
    }

    @GetMapping("/feedbacks/create")
    public String feedbackCreatePage() {
        return "feedbacks/feedbacks_create";
    }

    @GetMapping("/feedbacks/edit")
    public String feedbackEditPage() {
        return "feedbacks/feedbacks_edit";
    }
}
