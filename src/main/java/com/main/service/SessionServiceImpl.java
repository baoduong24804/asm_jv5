package com.main.service;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.HashMap;
import java.util.Map;

@Service
@SessionScope
public class SessionServiceImpl implements SessionService {
    private Map<String, Object> sessionMap = new HashMap<>();
    
    @Override
    public Object get(String key) {
        return sessionMap.get(key);
    }
    
    @Override
    public <T> T get(String key, T defaultValue) {
        Object value = sessionMap.get(key);
        return value != null ? (T) value : defaultValue;
    }

    @Override
    public void set(String key, Object value) {
        sessionMap.put(key, value);
    }
}

