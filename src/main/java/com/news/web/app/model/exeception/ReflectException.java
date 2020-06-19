package com.news.web.app.model.exeception;

/**
 * 请求入参异常
 *
 * @author Created by Steven.yu on 2020/06/18
 */
public class ReflectException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public ReflectException(String msg) {
        super(msg);
    }

}
