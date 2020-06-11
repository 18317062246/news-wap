package com.news.web.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

/**
 * @author zouyuan1
 */
@Configuration
public class TemplateConfig {
    @Bean
    public RestTemplate restTemplate(ClientHttpRequestFactory factory) {
        return new RestTemplate(factory);
    }

    @Bean
    public ClientHttpRequestFactory simpleClientHttpRequestFactory() {
        //添加初始化配置（也可以不配，有默认的）--注意RestTemplate只有初始化配置，没有什么连接池
        //默认的是JDK提供http连接，需要的话可以
        //通过setRequestFactory方法替换为例如Apache HttpComponents、Netty或
        //OkHttp等其它HTTP library。
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        //单位为ms
        factory.setReadTimeout(5000);
        //单位为ms
        factory.setConnectTimeout(5000);
        return factory;
    }
}