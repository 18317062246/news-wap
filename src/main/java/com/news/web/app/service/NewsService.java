/**
 * @Author: Steven.yu
 * @Description: 资讯业务逻辑层
 * @CreateTime: 2020/07/02 10:34:49
 */
package com.news.web.app.service;

import com.alibaba.fastjson.JSONObject;
import com.news.web.app.model.AdType;
import com.news.web.app.model.NewsRelated;
import com.news.web.app.model.NewsType;
import com.news.web.app.model.common.CommonHouseResult;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.List;

public interface NewsService extends Serializable {

    /**
     * @param cityen 城市简称
     * @param location 位置信息
     * @return 获取栏目列表
     */
    List<NewsType> typeList(String cityen, String location);

    /**
     * @param cityen 城市简称
     * @param location 位置信息
     * @return 获取栏目列表
     */
    List<NewsType> typeList(String cityen, String location , Integer id);

    /**
     * @param cityen 城市简称
     * @param typeId 栏目id
     * @param page 当前页
     * @param pagesize 行数据
     * @param order 排序
     * @param key 关键字
     * @return 获取指定栏目的资讯新闻列表信息
     */
    JSONObject newsList(String cityen, List<Integer> typeId, Integer page, Integer pagesize, Integer order, String key);

    /**
     * @param cityen 城市简称
     * @param page 当前页
     * @param pagesize 行数据
     * @param desc 排序方式
     * @return 取最新的资讯列表信息
     */
    JSONObject newsList(String cityen, Integer page, Integer pagesize, Integer desc);
    
    /**
     * @param cityen 城市简称
     * @param typeId 百科栏目id
     * @param location 位置信息
     * @param page 当前页
     * @param pagesize 行数据
     * @param order 排序
     * @param key 关键字
     * @return 获取百科数据列表信息
     */
    JSONObject newsListByBaike(String cityen,Integer typeId,  String location, Integer page, Integer pagesize, Integer order, String key);

    /**
     * @param xinfangTypes 新房房源集合
     * @param cityen 城市简称
     * @return 通过新房房源集合获取新房房源信息
     */
    List<CommonHouseResult> getXinFangInfo(List<NewsRelated> xinfangTypes , String cityen);

    /**
     * @param ershoufangTypes 二手房房源集合
     * @param cityen 城市简称
     * @return 通过二手房房源集合获取二手房房源信息
     */
    List<CommonHouseResult> getErshouFangInfo(List<NewsRelated> ershoufangTypes , String cityen);

    /**
     * @param xiaoquTypes 小区房源集合
     * @param cityen 城市简称
     * @return 通过小区房源集合获取小区房源信息
     */
    List<CommonHouseResult> getXiaoQuInfo(List<NewsRelated> xiaoquTypes , String cityen);

    /**
     * 记录日志
     */
    void insertLog(HttpServletRequest request , String cityShort , Integer newsId);


    List<AdType> adList(String cityen, String ad_name, String app_name);
}
