// Model: 도메인 객체를 표현하며, 데이터베이스의 테이블을 대응하는 클래스입니다.
package ac.tukorea.gradebuddy.domain.assignments;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Assignment {
    private Integer assignmentId;
    private Integer userId;
    private String assignmentTitle;
    private String assignmentDescription;
    private Date assignmentDeadline;
}
