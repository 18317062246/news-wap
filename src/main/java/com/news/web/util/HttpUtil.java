package com.news.web.util;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.news.web.app.model.exeception.ReflectException;
import okhttp3.*;
import okhttp3.Request.Builder;

import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.TimeUnit;

@SuppressWarnings("all")
public class HttpUtil implements Serializable {
    private static final MediaType JSON = MediaType.get("application/json; charset=utf-8");
    private static final ObjectMapper mapper = new ObjectMapper();
    private Timeouts timeouts;
    private ConnectionPool connectionPool;
    private OkHttpClient client;

    public HttpUtil() {
        this.timeouts = new Timeouts();
        this.connectionPool = new ConnectionPool();
    }

    public HttpUtil(Long readTimeout) {
        this.timeouts = new Timeouts(readTimeout);
        this.connectionPool = new ConnectionPool();
    }

    public HttpUtil(Timeouts timeouts) {
        this.timeouts = timeouts;
        this.connectionPool = new ConnectionPool();
    }

    public HttpUtil(Timeouts timeouts, ConnectionPool connectionPool) {
        this.timeouts = timeouts;
        this.connectionPool = connectionPool;
    }

    public String get(String url) throws IOException {
        return this.get(url, null);
    }

    public String get(String url, Map<String, String> headers) throws IOException {
        return this.exec(url, headers);
    }

    public String get(String url, Object params, Map<String, String> headers) throws IOException {
        url += "?" + parseURLPair(params);
        return get(url, headers);
    }

    private static String parseURLPair(Object o) {
        Class<? extends Object> c = o.getClass();
        Field[] fields = c.getDeclaredFields();
        Map<String, Object> map = new TreeMap<>();
        for (Field field : fields) {
            field.setAccessible(true);
            String name = field.getName();
            Object value;
            try {
                value = field.get(o);
            } catch (IllegalAccessException e) {
                throw new ReflectException("反射对象转URL 键值对错误！");
            }
            if (value != null)
                map.put(name, value);
        }
        Set<Entry<String, Object>> set = map.entrySet();
        Iterator<Entry<String, Object>> it = set.iterator();
        StringBuilder sb = new StringBuilder();
        while (it.hasNext()) {
            Entry<String, Object> e = it.next();
            sb.append(e.getKey()).append("=").append(e.getValue()).append("&");
        }
        if (sb.length() == 0) return "";
        return sb.deleteCharAt(sb.length() - 1).toString();
    }

    public String post(String url, Object param) throws IOException {
        return this.post(url, param, null);
    }

    public String post(String url, Object param, Map<String, String> headers) throws IOException {
        return this.exec(url, param, headers);
    }

    private String exec(String url, Object param, Map<String, String> headers) throws IOException {
        Builder requestBuilder = (new Builder()).url(url);
        if (param != null) {
            if (param instanceof String) requestBuilder.post(RequestBody.create(JSON,(String)param));
            else requestBuilder.post(RequestBody.create(JSON, mapper.writeValueAsString(param)));
        }

        if (headers != null) {
            Iterator var5 = headers.entrySet().iterator();

            while (var5.hasNext()) {
                Entry<String, String> entry = (Entry) var5.next();
                requestBuilder.addHeader((String) entry.getKey(), (String) entry.getValue());
            }
        }

        return this.exec(requestBuilder);
    }

    private String exec(String url, Map<String, String> headers) throws IOException {
        Builder requestBuilder = (new Builder()).url(url);
        if (headers != null) {
            Iterator var4 = headers.entrySet().iterator();

            while (var4.hasNext()) {
                Entry<String, String> entry = (Entry) var4.next();
                requestBuilder.addHeader((String) entry.getKey(), (String) entry.getValue());
            }
        }

        return this.exec(requestBuilder);
    }

    private String exec(Builder requestBuilder) throws IOException {
        Response response = this.getInstance().newCall(requestBuilder.build()).execute();
        Throwable var3 = null;

        String var5;
        try {
            ResponseBody responseBody = response.body();
            if (responseBody != null) {
                var5 = responseBody.string();
                return var5;
            }

            var5 = null;
        } catch (Throwable var15) {
            var3 = var15;
            throw var15;
        } finally {
            if (response != null) {
                if (var3 != null) {
                    try {
                        response.close();
                    } catch (Throwable var14) {
                        var3.addSuppressed(var14);
                    }
                } else {
                    response.close();
                }
            }

        }

        return var5;
    }

    private OkHttpClient getInstance() {
        if (this.client != null) {
            return this.client;
        } else {
            this.client = (new okhttp3.OkHttpClient.Builder()).connectionPool(this.connectionPool).readTimeout(this.timeouts.getReadTimeout(), TimeUnit.MILLISECONDS).writeTimeout(this.timeouts.getWriteTimeout(), TimeUnit.MILLISECONDS).connectTimeout(this.timeouts.getConnectTimeout(), TimeUnit.MILLISECONDS).build();
            return this.client;
        }
    }

    static {
        mapper.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    public static class Timeouts implements Serializable {
        private long connectTimeout = 5000L;
        private long readTimeout = 3000L;
        private long writeTimeout = 3000L;

        Timeouts() {
        }

        Timeouts(long readTimeout) {
            this.readTimeout = readTimeout;
        }

        public Timeouts(long connectTimeout, long readTimeout, long writeTimeout) {
            this.connectTimeout = connectTimeout;
            this.readTimeout = readTimeout;
            this.writeTimeout = writeTimeout;
        }

        public long getConnectTimeout() {
            return this.connectTimeout;
        }

        public void setConnectTimeout(int connectTimeout) {
            this.connectTimeout = (long) connectTimeout;
        }

        public long getReadTimeout() {
            return this.readTimeout;
        }

        public void setReadTimeout(int readTimeout) {
            this.readTimeout = (long) readTimeout;
        }

        public long getWriteTimeout() {
            return this.writeTimeout;
        }

        public void setWriteTimeout(int writeTimeout) {
            this.writeTimeout = (long) writeTimeout;
        }
    }
}

