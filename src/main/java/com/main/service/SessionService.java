package com.main.service;

public interface SessionService {
    Object get(String key); // Get value by key
    <T> T get(String key, T defaultValue); // Get value by key with a default value
    void set(String key, Object value); // Set key-value pair
}
