/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/05/13 15:13:56
 */
package com.news.web.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class NewsWebAppApplication  extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(NewsWebAppApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(NewsWebAppApplication.class , args);
    }

}
