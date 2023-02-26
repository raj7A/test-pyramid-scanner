package com.example.demo.user;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class UserTest {

    @Test
    void createUser() {
        Assertions.assertNotNull(new User());
    }

    @Test
    void createUserId() {
        User user = new User();
        Assertions.assertNotNull(user.getId());
    }

    @Test
    void createUserWithName() {
        User user = new User("tp");
        Assertions.assertNotNull(user.getName());
    }
}