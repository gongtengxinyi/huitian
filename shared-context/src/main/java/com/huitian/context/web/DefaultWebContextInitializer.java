package com.huitian.context.web;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import com.huitian.context.DefaultContextInitializer;

public class DefaultWebContextInitializer extends DefaultContextInitializer
        implements ServletContextAware {

    @Override
    public void setServletContext(ServletContext servletContext) {
        ServletContextHolder.setServletContext(servletContext);
    }
}