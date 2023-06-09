// Model: 도메인 객체를 표현하며, 데이터베이스의 테이블을 대응하는 클래스입니다.
package ac.tukorea.gradebuddy.domain.feedbacks;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Feedback {
    private Integer feedbackId;
    private Integer submissionsId;
    private Integer userId;
    private Integer feedbackScore;
    private String feedbackComment;
}