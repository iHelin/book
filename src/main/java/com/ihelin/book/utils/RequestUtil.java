package com.ihelin.book.utils;

import cn.hutool.core.util.StrUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.Set;

public class RequestUtil {

    private static final Logger logger = LoggerFactory.getLogger(RequestUtil.class);

    public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
    }

    public static HttpSession getSession() {
        return getRequest().getSession();
    }

    @SuppressWarnings("unchecked")
    public static String getCompleteRequestURL(HttpServletRequest request, Set<String> rpSet) {
        if (request == null) {
            return "";
        }
        String url = "";
        url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + request.getServletPath();
        Enumeration<String> names = request.getParameterNames();
        int i = 0;
        if (names != null) {
            while (names.hasMoreElements()) {
                String name = names.nextElement();
				String value = request.getParameter(name);
				if (value == null || (rpSet != null && rpSet.contains(name))) {
					continue;
				}
				url = url + (i++ == 0 ? "?" : "&") + name + "=" + value;
			}
		}
		return url;
	}

	public static String getCompleteRequestURL(HttpServletRequest request){
		return getCompleteRequestURL(request, (String)null);
	}

    @SuppressWarnings("unchecked")
    public static String getCompleteRequestURL(HttpServletRequest request, String rmParam) {
        if (request == null) {
            return "";
        }
        String url = "";
        url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + request.getServletPath();
        Enumeration<String> names = request.getParameterNames();
        int i = 0;
        if (names != null) {
            while (names.hasMoreElements()) {
                String name = names.nextElement();
				String value = request.getParameter(name);
				if (value == null || name.equals(rmParam)) {
					continue;
				}
				url = url + (i++ == 0 ? "?" : "&") + name + "=" + value;
			}
		}
		return url;
	}


    public static String getRealIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Real-IP");
        if (!StrUtil.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
            return ip;
        }
        ip = request.getHeader("X-Forwarded-For");
        if (StrUtil.isNotBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
            int index = ip.indexOf(',');
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        }

        return request.getRemoteAddr();
    }

    /**
     * 代码参考 OSCHINA 的 @internetafei
     * 链接：<a href='http://www.oschina.net/code/snippet_19410_36902'> http://www.oschina.net/code/snippet_19410_36902 </a>
     */
	public static boolean isAjaxRequest(HttpServletRequest request) {
        return (request.getHeader("X-Requested-With") != null && "XMLHttpRequest".equals(request.getHeader("X-Requested-With")));
    }
}
