package org.codenova.studymate.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString

public class StudyMember {

    private int id;
    private String userId;
    private String groupId;
    private String role;
    private LocalDateTime appliedAt;
    private LocalDateTime joindAt;
}
