/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/28 16:44:28
 */
package com.news.web.util;

import java.io.Serializable;


public class StringResource implements Serializable {

    public static int lastIndexOf(String input, String substring) {
        if (input == null) input = "";
        if (substring == null) substring = "";
        return input.lastIndexOf(substring);
    }

}
