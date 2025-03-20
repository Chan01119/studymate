package org.codenova.studymate.model.entity;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Setter
@Getter
public class LoginLog {
    private int id;
    private String userId;
    private LocalDateTime loginAt;
}
