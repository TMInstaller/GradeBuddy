// Controller: 사용자의 요청을 받아 해당 요청을 처리하기 위한 비즈니스 로직을 서비스에 위임하고, 처리 결과를 사용자에게 응답으로 반환합니다.
package ac.tukorea.gradebuddy.domain.feedbacks;

import ac.tukorea.gradebuddy.domain.submissions.Submission;
import ac.tukorea.gradebuddy.domain.submissions.SubmissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class FeedbackController {
    private final FeedbackService feedbackService;
    private final SubmissionService submissionService;

    @Autowired
    public FeedbackController(FeedbackService feedbackService, SubmissionService submissionService) {
        this.feedbackService = feedbackService;
        this.submissionService = submissionService;
    }

    @GetMapping("/feedbacks/list")
    public String feedbackListPage(Model model) {
        List<Feedback> feedbacks =  feedbackService.getAllFeedbacks();
        model.addAttribute("feedbacks", feedbacks);
        return "feedbacks/feedbacks_list";
    }

    @GetMapping("/feedbacks/detail")
    public String feedbackDetailPage() {
        return "feedbacks/feedbacks_detail";
    }

    @GetMapping("/feedbacks/create/{assignmentId}")
    public String feedbackCreatePage(@PathVariable("assignmentId") Integer assignmentId, Model model) {
        Submission submission = submissionService.getSubmissionByAssignmentId(assignmentId);
        model.addAttribute("submission", submission);
        return "feedbacks/feedbacks_create";
    }

    @PostMapping("/feedbacks/create")
    public String createFeedback(Feedback feedback) {
        feedbackService.createFeedback(feedback);
        return "redirect:/feedbacks/list";
    }

    @GetMapping("/feedbacks/edit")
    public String feedbackEditPage() {
        return "feedbacks/feedbacks_edit";
    }

    @GetMapping("/feedbacks/delete/{feedbackId}")
    public String deleteFeedback(@PathVariable("feedbackId") Integer feedbackId) {
        feedbackService.deleteFeedbackById(feedbackId);
        return "redirect:/feedbacks/list";
    }
}
