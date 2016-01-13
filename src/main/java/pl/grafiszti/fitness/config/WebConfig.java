package pl.grafiszti.fitness.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan
public class WebConfig extends WebMvcConfigurerAdapter {

  @Bean
  public FreeMarkerConfigurer freeMarkerConfigurer() {
    FreeMarkerConfigurer fmc = new FreeMarkerConfigurer();
    fmc.setTemplateLoaderPath("/WEB-INF/views/");
    return fmc;
  }

  @Bean
  public FreeMarkerViewResolver freeMarkerViewResolver() {
    FreeMarkerViewResolver fvr = new FreeMarkerViewResolver();
    fvr.setCache(false);
    fvr.setPrefix("");
    fvr.setSuffix(".ftl");
    fvr.setRequestContextAttribute("rc");
    return fvr;
  }
  
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
      registry
          .addResourceHandler("/resources/**")
          .addResourceLocations("/resources/")
      ;
  }
}
