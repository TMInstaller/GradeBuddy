// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.submissions;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SubmissionController {

    @GetMapping("/submissions/list")
    public String submissionListPage() {
        return "submissions/submissions_list";
    }

    @GetMapping("/submissions/detail")
    public String submissionDetailPage() {
        return "submissions/submissions_detail";
    }

    @GetMapping("/submissions/create")
    public String submissionCreatePage() {
        return "submissions/submissions_create";
    }

    @GetMapping("/submissions/edit")
    public String submissionEditPage() {
        return "submissions/submissions_edit";
    }
}
