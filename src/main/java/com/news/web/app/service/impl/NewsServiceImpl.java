/**
 * @Author: Steven.yu
 * @Description: 资讯业务逻辑层
 * @CreateTime: 2020/07/02 10:35:38
 */
package com.news.web.app.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.google.common.collect.Lists;
import com.news.web.app.config.ApiConfig;
import com.news.web.app.config.BizComConfig;
import com.news.web.app.model.AdType;
import com.news.web.app.model.NewsRelated;
import com.news.web.app.model.NewsType;
import com.news.web.app.model.common.AopResult;
import com.news.web.app.model.common.CommonFootInfo;
import com.news.web.app.model.common.CommonHouseResult;
import com.news.web.app.model.esf.ESFResult;
import com.news.web.app.model.param.InsertLogParam;
import com.news.web.app.model.xiaoqu.XiaoQuResult;
import com.news.web.app.model.xinfang.XinfangResult;
import com.news.web.app.service.NewsService;
import com.news.web.util.CentaioUtil;
import com.news.web.util.CommonUtil;
import com.news.web.util.HttpUtil;
import com.news.web.util.StringResource;
import com.news.web.util.parser.NewsParser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@SuppressWarnings("all")
@RequiredArgsConstructor
public class NewsServiceImpl implements NewsService {

    private final RestTemplate restTemplate;
    private final ApiConfig apiConfig;
    private final HttpUtil httpUtil;
    private final BizComConfig bizComConfig;

    @Value("${api.domain}")
    public String apiurl;
    @Value("${api.xinfang.other.city}")
    public String xinfangOtherCityAddress;
    @Value("${api.xinfang.sz.city}")
    public String xinfangSZCityAddress;
    @Value("${api.esf.other.city}")
    public String esfOtherCityAddress;
    @Value("${api.esf.sz.city}")
    public String esfSZCityAddress;
    @Value("${api.xiaoqu.other.city}")
    public String xiaoquOtherCityAddress;
    @Value("${api.xiaoqu.sz.city}")
    public String xiaoquSZCityAddress;

    private static final String RESULT = "Result";
    /**
     * 是否存在房源信息
     */
    private static final String CITYEN = "cityen";
    private static final String TYPEID = "typeid";
    private static final String ARTICLE_IS_NULL_TEXT = "请求文章列表为空=>{}";
    /**
     * 广告相关
     */
    private static final String AD_BASE_API_URL="http://api-testweb.centaline.com.cn/bizcom/json/reply/SearchRankItemRequest";
    /**
     * @param cityen 城市简称
     * @param location 位置信息
     * @return 获取栏目列表
     */
    @Override
    public List<NewsType> typeList(String cityen, String location) {
        Map map = new HashMap();
        map.put(CITYEN, cityen);
        map.put("platform", "wap");
        map.put("location", location);
        JSONObject jSONObject = restTemplate.getForObject(apiurl
                + "GetColumnList?cityen={cityen}&platform={platform}&location={location}", JSONObject.class, map);
        String data = JSON.toJSONString(jSONObject.get(RESULT));
        return JSON.parseArray(data, NewsType.class);
    }

    /**
     * @param cityen 城市简称
     * @param location 位置信息
     * @param id 栏目id
     * @return 获取栏目列表
     */
    @Override
    public List<NewsType> typeList(String cityen, String location , Integer id ) {
        Map map = new HashMap();
        map.put(CITYEN, cityen);
        map.put("platform", "wap");
        map.put("location", location);
        map.put("id", id);
        JSONObject jSONObject = restTemplate.getForObject(apiurl
                + "GetColumnList?cityen={cityen}&platform={platform}&location={location}&id={id}", JSONObject.class, map);
        String data = JSON.toJSONString(jSONObject.get(RESULT));
        return JSON.parseArray(data, NewsType.class);
    }

    /**
     * @param cityen 城市简称
     * @param typeId 栏目id
     * @param page 当前页
     * @param pagesize 行数据
     * @param order 排序
     * @param key 关键字
     * @return 获取指定栏目的资讯新闻列表信息
     */
    @Override
    public JSONObject newsList(String cityen, List<Integer> typeId, Integer page, Integer pagesize, Integer order, String key) {
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        if(StringUtils.isEmpty(key)){
            map.put(TYPEID, typeId.toString().replaceAll("\\[", "").replaceAll("\\]", ""));
        }else{
            map.put(TYPEID, null);
        }
        map.put("key", key);
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        map.put("title", key);
        map.put("description", key);
        map.put("pubdate", CommonUtil.getCurrentMills());
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        "GetNewsList?cityen={cityen}&platform=wap&typeid={typeid}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}&pubdate={pubdate}"
                , JSONObject.class, map);
        return jSONObject.getJSONObject(RESULT);
    }

    /**
     * @param cityen 城市简称
     * @param page 当前页
     * @param pagesize 行数据
     * @param desc 排序方式
     * @return 取最新的资讯列表信息
     */
    @Override
    @SuppressWarnings("all")
    public JSONObject newsList(String cityen, Integer page, Integer pagesize, Integer desc) {
        String serviceUrl = String.format(apiurl + "GetNewsList?cityen=%s&platform=wap&page=%s&pagesize=%s&isDesc=%s&pubdate=%s" , cityen , page , pagesize  , desc , CommonUtil.getCurrentMills());
        //发出http请求
        try {
            String json = httpUtil.get(serviceUrl);
            if(org.apache.commons.lang3.StringUtils.isNoneBlank(json)){
                AopResult<JSONObject> jsonObjectResult = JSON.parseObject(json , AopResult.class);
                return jsonObjectResult.getResult();
            }else {
                return null;
            }
        } catch (IOException e) {
            return null;
        }
    }

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
    @Override
    public JSONObject newsListByBaike(String cityen,Integer typeId,  String location, Integer page, Integer pagesize, Integer order, String key) {
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        map.put("location", location);
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        map.put("title", key);
        map.put("description", key);
        map.put("pubdate", CommonUtil.getCurrentMills());
        if(!ObjectUtils.isEmpty(typeId)){
            map.put(TYPEID, typeId);
        }

        StringBuilder sql = new StringBuilder("GetNewsList?cityen={cityen}&platform=wap&location={location}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}&pubdate={pubdate}");
        if(!ObjectUtils.isEmpty(typeId)){
            sql.append("&typeid={typeid}");
        }
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        sql.toString()
                , JSONObject.class, map);
        JSONObject newsList = jSONObject.getJSONObject(RESULT);
        if (newsList.isEmpty()) {
            log.error(ARTICLE_IS_NULL_TEXT, newsList);
        }
        return newsList;
    }

    /**
     * @param xinfangTypes 新房房源集合
     * @param cityen 城市简称
     * @return 通过新房房源集合获取新房房源信息
     */
    @Override
    public List<CommonHouseResult> getXinFangInfo(List<NewsRelated> xinfangTypes , String cityen){
        //定义一个需要返回的集合对象
        List<CommonHouseResult> resultList = new ArrayList<>();
        //访问接口需要传入的map
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        //定义一个服务接口，用于获取房源数据
        String serviceUrl;
        if(Objects.equals(cityen , "sz")){//如果是深圳，使用深圳的新房接口
            serviceUrl = xinfangSZCityAddress;
        }else {//否则就使用其他城市公用的新房接口
            serviceUrl = xinfangOtherCityAddress;
        }
        //循环新房集合,取出新房数据
        xinfangTypes.stream().forEach(l -> {
            map.put("estExtId", l.getOid());
            JSONObject jSONObject = restTemplate.getForObject( serviceUrl + "?cityen={cityen}&EstExtId={estExtId}&platform=wap", JSONObject.class, map);
            JSONObject newsList = jSONObject.getJSONObject(RESULT);
            if (CollectionUtils.isEmpty(newsList)) {
                log.error(ARTICLE_IS_NULL_TEXT, newsList);
            }
            if(!CollectionUtils.isEmpty(newsList)){
                String data = JSON.toJSONString(jSONObject.get(RESULT));
                XinfangResult xinfangResult = JSON.parseObject(data, XinfangResult.class);
                if(!Objects.isNull(xinfangResult)){
                    xinfangResult.setNewsId(l.getNewsid());
                    xinfangResult.setOid(l.getOid());
                }
                resultList.add(new CommonHouseResult(xinfangResult , null , null));

            }
        });
        //将结果集进行过滤
        List<CommonHouseResult> results = resultList.stream().filter(Objects::nonNull).collect(Collectors.toList());
        return CollectionUtils.isEmpty(results) ? Collections.emptyList() : results;
    }

    /**
     * @param ershoufangTypes 二手房房源集合
     * @param cityen 城市简称
     * @return 通过二手房房源集合获取二手房房源信息
     */
    @Override
    @SuppressWarnings("all")
    public List<CommonHouseResult> getErshouFangInfo(List<NewsRelated> ershoufangTypes , String cityen){
        //定义一个需要返回的集合对象
        List<CommonHouseResult> resultList = new ArrayList<>();
        //访问接口需要传入的map
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);

        //定义一个服务接口，用于获取房源数据
        String serviceUrl;
        if(Objects.equals(cityen , "sz")){//如果是深圳，使用深圳的新房接口
            serviceUrl = esfSZCityAddress;
        }else {//否则就使用其他城市公用的新房接口
            serviceUrl = esfOtherCityAddress;
        }

        //循环新房集合,取出新房数据
        ershoufangTypes.stream().forEach(l -> {
            map.put("adsNo", l.getOid());
            JSONObject jSONObject = restTemplate.getForObject(serviceUrl + "?cityen={cityen}&AdsNo={adsNo}&platform=wap&PostType=S", JSONObject.class, map);
            JSONObject newsList = jSONObject.getJSONObject(RESULT);
            if (CollectionUtils.isEmpty(newsList)) {
                log.error(ARTICLE_IS_NULL_TEXT, newsList);
            }
            if(!CollectionUtils.isEmpty(newsList)){
                String data = JSON.toJSONString(jSONObject.get(RESULT));
                ESFResult esfResult = JSON.parseObject(data, ESFResult.class);
                if(!Objects.isNull(esfResult)){
                    //如果价格不为空，就对价格进行格式化
                    if(esfResult.getSalePrice() != null && esfResult.getSalePrice() > 0D) {
                        //将数据进行格式化
                        BigDecimal db = new BigDecimal(esfResult.getSalePrice());
                        String plainString = db.toPlainString();
                        String salePrice = plainString.substring(0, plainString.lastIndexOf("0000"));
                        esfResult.setSalePriceString(salePrice);
                        esfResult.setSalePrice(Long.parseLong(salePrice));
                    }
                    esfResult.setNewsId(l.getNewsid());
                    esfResult.setOid(l.getOid());
                }
                //将esfResult添加到结果集中
                resultList.add(new CommonHouseResult(null , esfResult , null));
            }
        });
        //将结果集进行过滤
        List<CommonHouseResult> results = resultList.stream().filter(Objects::nonNull).collect(Collectors.toList());
        return CollectionUtils.isEmpty(results) ? Collections.emptyList() : results;
    }

    /**
     * @param xiaoquTypes 小区房源集合
     * @param cityen 城市简称
     * @return 通过小区房源集合获取小区房源信息
     */
    @Override
    public List<CommonHouseResult> getXiaoQuInfo(List<NewsRelated> xiaoquTypes , String cityen){
        //定义一个需要返回的集合对象
        List<CommonHouseResult> resultList = Lists.newArrayList();

        //访问接口需要传入的map
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        //定义一个服务接口，用于获取房源数据
        String serviceUrl;

        if(Objects.equals(cityen , "sz")){//如果是深圳，使用深圳的小区接口
            serviceUrl = xiaoquSZCityAddress;
        }else {//否则就使用其他城市公用的新房接口
            serviceUrl = xiaoquOtherCityAddress;
        }

        //循环新房集合,取出新房数据
        xiaoquTypes.stream().forEach(l -> {
            map.put("estateCode", l.getOid());
            JSONObject jSONObject = restTemplate.getForObject(serviceUrl + "?cityen={cityen}&EstateCode={estateCode}&platform=pc&ImageWidth=375&ImageHeight=250", JSONObject.class, map);
            JSONObject newsList = jSONObject.getJSONObject(RESULT);
            if (CollectionUtils.isEmpty(newsList)) {
                log.error(ARTICLE_IS_NULL_TEXT, newsList);
            }
            if(!CollectionUtils.isEmpty(newsList)){
                String data = JSON.toJSONString(jSONObject.get(RESULT));
                XiaoQuResult xiaoQuResult = JSON.parseObject(data, XiaoQuResult.class);
                if(!Objects.isNull(xiaoQuResult)){
                    //如果价格不为空，就对价格进行格式化
                    if(xiaoQuResult.getSaleAvgPrice() != null && xiaoQuResult.getSaleAvgPrice() > 0D) {
                        //将数据进行格式化
                        //对平均价进行四舍五入
                        long saleAvgPrice = Math.round(xiaoQuResult.getSaleAvgPrice());
                        xiaoQuResult.setSaleAvgPriceString(saleAvgPrice);
                    }
                    xiaoQuResult.setOid(l.getOid());
                }
                //将esfResult添加到结果集中
                resultList.add(new CommonHouseResult(null , null , xiaoQuResult));
            }

        });
        //将结果集进行过滤
        List<CommonHouseResult> results = resultList.stream().filter(Objects::nonNull).collect(Collectors.toList());
        return CollectionUtils.isEmpty(results) ? Collections.emptyList() : results;
    }

    @Override
    public void insertLog(HttpServletRequest request , String cityShort, Integer newsId, String title , String downloadChannel) {
        //获取请求头
        String ua = request.getHeader(StringResource.USER_AGENT);
        String cityCode = "";
        String appName = "";
        String userId = "";
        String jPushId = "";
        String postId = "";
        String sourceChild = " ";
        String trackId = "";
        Integer begin = 0;
        Integer end = 0;
        String oringUri = request.getRequestURI();
        cityCode = CentaioUtil.getCityCode(cityShort);
        //获取用户ip
        String ClientIP = request.getRemoteAddr();
        //那cookie中的信息
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies
            ) {
                //获取UserID
                if (c.getName().equals(StringResource.CK_USER) || c.getName().equals(StringResource.CK_USER_WAP)) {
                    String value = c.getValue();
                    begin = value.indexOf(StringResource.BIG_U);
                    end = value.indexOf(StringResource.AND);
                    userId = value.substring(begin, end);
                }
                //获取trackID
                if (c.getName().equals(StringResource.COOKIE_NAME)) {
                    trackId = c.getValue();
                }
            }
        }
        //获取AppName
        if (ua.contains(StringResource.WINDOWS) || ua.contains(StringResource.INTEL_MAC_OS)) {
            appName = StringResource.PC;
        } else if (ua.contains(StringResource.LIKE_MAC_OS) || ua.contains(StringResource.ANDROID)) {
            if (ua.contains(StringResource.SALE_HOUSE) && ua.contains(StringResource.LIKE_MAC_OS)) {
                appName =StringResource.APP_IOS;
            } else if (ua.contains(StringResource.SALE_HOUSE) && ua.contains(StringResource.ANDROID)) {
                appName = StringResource.APP_ANDROID;
            } else if (ua.contains(StringResource.MICRO_MESSENGER)) {
                appName = StringResource.WE_CHAT;
            } else {
                appName = StringResource.WAP;
            }
        }
        //封装对象
        InsertLogParam param = NewsParser.build(appName , cityCode , ClientIP , jPushId , String.valueOf(newsId) , postId , sourceChild , trackId , userId, title , downloadChannel);
        try{
            String abc=httpUtil.post(String.format(StringResource.INSERT_VIEW_HISTORY_REQUEST_BY_RABBIT , apiConfig.getUrl()) , param);
        } catch (IOException e) {

        }
    }

    @Override
    public List<AdType> adList(String cityen, String ad_name, String app_name) {
        String adUrl=AD_BASE_API_URL+"?adNames="
                +ad_name+"&appName="
                +app_name+"&cityen=tj";
        //cityen拼接如url
        //String adUrl="http://api-testweb.centaline.com.cn/bizcom/json/reply/SearchRankItemRequest?adNames="
        // +AD_NAMES
        // +"&appName="
        // +APP_NAME
        // +"&cityen="
        // +cityen;
        System.out.println(adUrl);
        try {
            String json = httpUtil.get(adUrl);
            if(!json.contains("ModuleItem")){
                return Collections.EMPTY_LIST;
            }
            String jsonModuleItem = JSON.parseObject(json).get("Result").toString();
            jsonModuleItem=jsonModuleItem.substring(1,jsonModuleItem.length()-1);
            String data = JSON.toJSONString(JSON.parseObject(jsonModuleItem).get("ModuleItem"));
            return JSON.parseArray(data, AdType.class);
        } catch (IOException e) {
            return Collections.EMPTY_LIST;
        }
    }

    @Override
    public CommonFootInfo getFootInfo(String cityen) {
        // 新增ccdata biz后台并无此城市 由于配置统一直接读取上海城市配置
        if ("ccdata".equals(cityen)){
            cityen = "sh";
        }
        try {
            String json = httpUtil.get(String.format(bizComConfig.getFootUrl(), cityen));
            return JSON.parseObject(json, new TypeReference<AopResult<CommonFootInfo>>() {
            }).getResult();
        } catch (IOException e) {
            return null;
        }
    }

}
