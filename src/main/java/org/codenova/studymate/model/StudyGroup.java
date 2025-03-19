package org.codenova.studymate.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString

public class StudyGroup {

    private String id;
    private String name;
    private String type;
    private String goal;
    private String creatorId;
    private LocalDateTime createdAt;
    private int memberCount;
}
