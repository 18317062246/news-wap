/**
 * @Author: Steven.yu
 * @Description: 异常错误指向类
 * @CreateTime: 2020/07/15 14:10:40
 */
package com.news.web.app;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.io.Serializable;

@ControllerAdvice
public class NewsControllerAdvice implements Serializable {

    @ExceptionHandler(Exception.class)
    public String exceptionHandler(Exception e){
        return "error";
    }
}
