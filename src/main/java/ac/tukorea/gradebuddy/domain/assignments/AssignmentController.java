// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.assignments;

import ac.tukorea.gradebuddy.domain.users.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AssignmentController {

    private final AssignmentService assignmentService;

    @Autowired
    public AssignmentController(AssignmentService assignmentService) {
        this.assignmentService = assignmentService;
    }

    @GetMapping("/assignments/list")
    public String assignmentListPage(Model model) {
        List<Assignment> assignments = assignmentService.getAllAssignments();
        model.addAttribute("assignments", assignments);
        return "assignments/assignments_list";
    }

    @GetMapping("/assignments/detail/{id}")
    public String assignmentDetailPage(@PathVariable Integer id, Model model) {
        Assignment assignment = assignmentService.getAssignmentById(id);
        model.addAttribute("assignment", assignment);
        return "assignments/assignments_detail";
    }

    @GetMapping("/assignments/create")
    public String assignmentCreatePage() {
        return "assignments/assignments_create";
    }

    @PostMapping("/assignments/create")
    public String createAssignment(@ModelAttribute Assignment assignment, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) return "redirect:/users/login";
        assignment.setUserId(user.getUser_id());
        assignmentService.createAssignment(assignment);
        return "redirect:/assignments/list";
    }

    @GetMapping("/assignments/edit/{id}")
    public String assignmentEditPage(@PathVariable Integer id, Model model) {
        Assignment assignment = assignmentService.getAssignmentById(id);
        model.addAttribute("assignment", assignment);
        return "assignments/assignments_edit";
    }

    @PostMapping("/assignments/edit/{id}")
    public @ResponseBody Assignment updateAssignment(@PathVariable Integer id, @RequestBody Assignment assignment) {
        assignment.setAssignmentId(id);
        assignmentService.updateAssignment(assignment);
        return assignment;
    }

    @GetMapping("/assignments/delete/{id}")
    public String deleteAssignment(@PathVariable Integer id) {
        assignmentService.deleteAssignment(id);
        return "redirect:/assignments/list";
    }
}
