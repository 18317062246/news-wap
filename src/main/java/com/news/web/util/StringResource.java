/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/28 16:44:28
 */
package com.news.web.util;

import java.io.Serializable;

@SuppressWarnings("all")
public class StringResource implements Serializable {

    /**
     * 经纪人信息需要存储的参数
     */
    public static String JINGJIREN_SHARE_VALUE = "?%s";

    /**
     * 经纪人存储key
     */
    public static String JINGJIREN_SHARE_KEY = "jingJiRenShareKey";

    /**
     *
     * @param input 需要处理的字符串
     * @param substring 通过什么字符进行分割
     * @return 获取substring的索引位置
     */
    public static int lastIndexOf(String input, String substring) {
        if (input == null) input = "";
        if (substring == null) substring = "";
        return input.lastIndexOf(substring);
    }

}
