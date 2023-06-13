package com.selena.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
public class MVCConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		
		
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		
		
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");		
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
		
		
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "C:/upload/");		
	}
	
	@Bean
	public ViewResolver viewResolver() {

		// Class InternalResourceViewResolver implements ViewResolver
		InternalResourceViewResolver bean = new InternalResourceViewResolver();

		// thiết lập view engine
		bean.setViewClass(JstlView.class);

		// Đường dẫn thư mực gốc chứa Views.
		bean.setPrefix("/WEB-INF/views/");

		// Tên đuôi của View
		bean.setSuffix(".jsp");

		return bean;

	}
}