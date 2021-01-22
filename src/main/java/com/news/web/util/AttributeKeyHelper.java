/**
 * @Author: Steven.yu
 * @Description: 静态常量key
 * @CreateTime: 2020/09/16 10:54:21
 */
package com.news.web.util;

import java.io.Serializable;

public interface AttributeKeyHelper extends Serializable {

    /**
     * 是否隐藏顶部菜单标识
     */
    String HIDE_TAB = "hidetab";

    /**
     * open，隐藏顶部菜单
     */
    String OPEN = "open";

    /**
     * jtyy
     */
    String CENTANET = "jtyy";

    /**
     * index page
     */
    String INDEX_PAGE = "index";

    /**
     * 北京，城市简称
     */
    String BJ_CITY_EN = "bj";

    /**
     * 南京，城市简称
     */
    String NJ_CITY_EN = "nj";

    /**
     * 东莞，城市简称
     */
    String DG_CITY_EN = "dg";

    /**
     * 惠州，城市简称
     */
    String HZ_CITY_EN = "hz";

    /**
     * flag
     */
    String FLAG = "flag";

    /**
     * 当前栏目
     */
    String TAB_TYPE = "tabtype";

    /**
     * tab栏目
     */
    String TYPES = "types";

    /**
     * 文章列表
     */
    String NEWS = "news";

    /**
     * 搜索key
     */
    String SEARCH_KEY = "key";

    /**
     * hot_list page
     */
    String HOT_LIST_PAGE = "hot_list";

    /**
     * 静态url
     */
    String STATIC_URL = "staticurl";

    /**
     * 新房key
     */
    String XINFANG_KEY = "xinfang";

    /**
     * 二手房key
     */
    String ERSHOUFANG_KEY = "ershoufang";

    /**
     * 小区key
     */
    String XIAOQU_KEY = "xiaoqu";

    /**
     * 绑定的房源数据信息
     */
    String COMMON_HOUSE_RESULT = "commonHouseResult";

    /**
     * url
     */
    String URL = "url";

    /**
     * 详情中的url返回字段
     */
    String DETAIL_BY_URL_ATTR = "Url";

    /**
     * 跳转链接
     */
    String REDIRECT_LINK = "redirect:%s";

    /**
     * 文章内容
     */
    String CONTENT = "Content";

    /**
     * 详情文章内容
     */
    String DETAIL_CONTENT = "detailContent";

    /**
     * 详情
     */
    String DETAIL = "detail";

    /**
     * 增加文章点击量
     */
    String NEWS_DETAIL_CLICK_ADDRESS = "newsDetailClickAddress";

    /**
     * 文章id
     */
    String NEWS_ID = "newsId";

    /**
     * 详情页面
     */
    String NEWS_DETAIL_PAGE = "news_detail";

    /**
     * 总页数
     */
    String TOTAL_PAGE = "TotalPage";

    /**
     * 返回状态
     */
    String RESULT_NO = "ResultNo";

    /**
     * 当前页
     */
    String CURRENT_PAGE = "CurrentPage";

    /**
     * 分页
     */
    String PAGE_UTIL_BY_P = "p";

    /**
     * 写字楼商铺列表页面
     */
    String BUSINESS_HEADLINE_LIST_PAGE = "business_headline_list";

    /**
     * 写字楼商铺详情页面
     */
    String BUSINESS_HEADLINE_DETAIL_PAGE = "business_headline_detail";
}
