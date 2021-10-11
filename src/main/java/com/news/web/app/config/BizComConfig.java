/**
 * author: yuhai
 * CreateTime: 2021/10/11
 * Description:
 */
package com.news.web.app.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Configuration
@ConfigurationProperties(prefix = "bizcom")
@Data
@Component
public class BizComConfig {

    /**
     * 获取版本及日期的相关信息
     */
    private String footUrl;
}
