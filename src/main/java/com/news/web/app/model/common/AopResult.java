package com.news.web.app.model.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AopResult<T> {
    /**
     *
     * 0 OK (成功)
     * 201 Created (已创建)
     * 204 No Content (没有内容)
     * 304 Not Modified (未修改)
     * -1 Bad Request (错误的请求)
     * 401 Unauthorized (未授权)
     * 403 Forbidden (禁止访问
     * 404 Not Found (未找到)
     * 405 Method Not Allowed (方法被禁止)
     * 410 Gone (已删除)
     * 415 Unsupported Media Type (不支持的媒体类型)
     * 422 Unprocessable Entity (无法处理的实体)
     * 429 Too Many Requests (请求过多)
     */
    @ApiModelProperty("返回值 0 OK (成功) -1 Bad Request (错误的请求)")
    @JsonProperty("ResultNo")
    private Integer resultNo;

    @ApiModelProperty("返回对象")
    @JsonProperty("Result")
    private T result;

    @ApiModelProperty("返回描述")
    @JsonProperty("Message")
    private String message;

    @ApiModelProperty("总数")
    @JsonProperty("Total")
    private Integer total;


    public static <T> AopResult.Result<T> success(T result) {
        return success(0, result);
    }

    public static <T> AopResult.Result<T> success(int total, T result) {
        return success(0, total, result);
    }

    public static <T> AopResult.Result<T> success(int resultNo, int total, T result) {
        return success(resultNo, total, result, null);
    }

    public static <T> AopResult.Result<T> success(int resultNo, int total, T result, String message) {
        return new AopResult.Result<T>().success(resultNo, total, result, message);
    }

    public static <T> AopResult.Result<T> fail() {
        return fail("error!");
    }

    public static <T> AopResult.Result<T> fail(String message) {
        return fail(-1, message);
    }

    public static <T> AopResult.Result<T> fail2(String message) {
        return fail2(-1, message);
    }

    public static <T> AopResult.Result<T> fail(int resultNo, String message) {
        return (new AopResult.Result<T>()).fail(resultNo, message);
    }

    public static <T> AopResult.Result<T> fail2(int resultNo, String message) {
        return (new AopResult.Result<T>()).fail2(resultNo, message);
    }


    @JsonInclude(JsonInclude.Include.NON_NULL)
    public static class Result<T> implements Serializable {
        private static final long serialVersionUID = 1718409123819880582L;

        @ApiModelProperty("返回值 0 OK (成功) -1 Bad Request (错误的请求)")
        @JsonProperty("ResultNo")
        private int resultNo;

        @ApiModelProperty("返回描述")
        @JsonProperty("Message")
        private String message;

        @ApiModelProperty("总数")
        @JsonProperty("Total")
        private int total;

        @ApiModelProperty("接口处理时间")
        @JsonProperty("Elapsed")
        private long elapsed;

        @ApiModelProperty("时间戳")
        @JsonProperty("Timestamp")
        private Date timestamp;

        @ApiModelProperty("调用端机器")
        @JsonProperty("Machine")
        private String machine;

        @ApiModelProperty("返回对象")
        @SuppressWarnings("all")
        @JsonProperty("Result")
        private T data;

        public int getResultNo() {
            return this.resultNo;
        }

        public void setResultNo(int resultNo) {
            this.resultNo = resultNo;
        }

        public String getMessage() {
            return this.message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public int getTotal() {
            return this.total;
        }

        public void setTotal(int total) {
            this.total = total;
        }

        public T getData() {
            return this.data;
        }

        public void setData(T data) {
            this.data = data;
        }

        public long getElapsed() {
            return this.elapsed;
        }

        public void setElapsed(long elapsed) {
            this.elapsed = elapsed;
        }

        public String getMachine() {
            return this.machine;
        }

        public void setMachine(String machine) {
            this.machine = machine;
        }

        public Date getTimestamp() {
            return this.timestamp != null ? new Date(this.timestamp.getTime()) : null;
        }

        public void setTimestamp(Date timestamp) {
            this.timestamp = timestamp != null ? new Date(timestamp.getTime()) : null;
        }

        public Result<T> success(T result) {
            return success(0, result);
        }

        public Result<T> success(int total, T result) {
            return success(0, total, result);
        }

        public Result<T> success(int resultNo, int total, T result) {
            return success(resultNo, total, result, null);
        }

        AopResult.Result<T> success(int resultNo, int total, T data, String message) {
            this.resultNo = resultNo;
            this.total = total;
            this.data = data;
            this.message = message;
            return this;
        }

        AopResult.Result<T> fail(int resultNo, String message) {
            this.message = message;
            this.resultNo = resultNo;
            this.data = null;
            this.total = 0;
            return this;
        }

        AopResult.Result<T> fail2(int resultNo, String message) {
            this.message = message;
            this.resultNo = resultNo;
            this.data = (T) Arrays.asList();//返回空集合
            this.total = 0;
            return this;
        }
    }
}