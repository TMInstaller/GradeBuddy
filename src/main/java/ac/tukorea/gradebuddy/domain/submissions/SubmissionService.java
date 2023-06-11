// Service: 비즈니스 로직을 수행하며, 필요에 따라 데이터의 조회, 저장 등을 위해 DAO를 사용합니다.
package ac.tukorea.gradebuddy.domain.submissions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubmissionService {
    private final SubmissionMapper submissionMapper;

    @Autowired
    public SubmissionService(SubmissionMapper submissionMapper) {
        this.submissionMapper = submissionMapper;
    }

    public void createSubmission(Submission submission) {
        submissionMapper.createSubmission(submission);
    }

    public List<Submission> getAllSubmissions() {
        return submissionMapper.getAllSubmissions();
    }
}
