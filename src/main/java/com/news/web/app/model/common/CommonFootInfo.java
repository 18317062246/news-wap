/**
 * author: yuhai
 * CreateTime: 2021/10/11
 * Description: 公共底部信息
 */
package com.news.web.app.model.common;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.news.web.util.DateHelper;
import lombok.Data;

import java.util.Date;

@Data
public class CommonFootInfo {

    /**
     * 版本
     */
    private String version;

    /**
     * 时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd" , timezone = "GMT+8")
    private Date currentVersionReleaseDate;

    /**
     * 字符串时间
     */
    private String currentDate;

    public String getCurrentDate() {
        return DateHelper.dateToString(currentVersionReleaseDate);
    }
}
