// Model: 도메인 객체를 표현하며, 데이터베이스의 테이블을 대응하는 클래스입니다.
package ac.tukorea.gradebuddy.domain.submissions;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Submission {
    private Integer submissionsId;
    private Integer userId;
    private Integer assignmentId;
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime submissionTime;
}