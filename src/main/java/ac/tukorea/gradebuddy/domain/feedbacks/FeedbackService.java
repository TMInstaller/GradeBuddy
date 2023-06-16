// Service: 비즈니스 로직을 수행하며, 필요에 따라 데이터의 조회, 저장 등을 위해 DAO를 사용합니다.
package ac.tukorea.gradebuddy.domain.feedbacks;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedbackService {
    private final FeedbackMapper feedbackMapper;

    @Autowired
    public FeedbackService(FeedbackMapper feedbackMapper) {
        this.feedbackMapper = feedbackMapper;
    }

    public void createFeedback(Feedback feedback) {
        feedbackMapper.createFeedback(feedback);
    }

    public Feedback getFeedbackById(Integer feedback_id) {
        return feedbackMapper.getFeedbackById(feedback_id);
    }

    public List<Feedback> getAllFeedbacks() {
        return feedbackMapper.getAllFeedbacks();
    }

    public List<Feedback> getFeedbacksByAssignmentId(Integer assignment_id) {
        return feedbackMapper.getFeedbacksByAssignmentId(assignment_id);
    }
}
