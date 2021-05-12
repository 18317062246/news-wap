package com.news.web.app.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

/**
 * @author: Created by yuhai on 2021/05/12
 */
@Configuration
@Data
@Component
@ConfigurationProperties(prefix = "logapi")
public class ApiConfig {

    private String url;
}
