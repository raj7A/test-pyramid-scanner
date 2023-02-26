package com.example.demo.user;

import java.util.UUID;

public class User {
    private String id;
    private String name;

    public User() {
        this.id = UUID.randomUUID().toString();
    }
    public User(String name) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
