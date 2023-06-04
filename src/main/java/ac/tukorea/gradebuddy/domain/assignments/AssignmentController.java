// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.assignments;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AssignmentController {

    @GetMapping("/assignments/list")
    public String assignmentListPage() {
        return "assignments/assignments_list";
    }

    @GetMapping("/assignments/detail")
    public String assignmentDetailPage() {
        return "assignments/assignments_detail";
    }

    @GetMapping("/assignments/create")
    public String assignmentCreatePage() {
        return "assignments/assignments_create";
    }

    @GetMapping("/assignments/edit")
    public String assignmentEditPage() {
        return "assignments/assignments_edit";
    }
}
