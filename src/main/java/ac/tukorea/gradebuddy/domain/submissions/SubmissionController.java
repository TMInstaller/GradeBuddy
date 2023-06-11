// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.submissions;

import ac.tukorea.gradebuddy.domain.assignments.Assignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class SubmissionController {
    private final SubmissionService submissionService;

    @Autowired
    public SubmissionController(SubmissionService submissionService) {
        this.submissionService = submissionService;
    }

    @GetMapping("/submissions/list")
    public String submissionListPage(Model model) {
        List<Submission> submissions = submissionService.getAllSubmissions();
        model.addAttribute("submissions", submissions);
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
