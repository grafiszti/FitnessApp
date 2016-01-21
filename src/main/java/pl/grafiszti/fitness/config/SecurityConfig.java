package pl.grafiszti.fitness.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import pl.grafiszti.fitness.data.service.EmployeeService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired
  EmployeeService employeeService;

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.formLogin().loginPage("/login").defaultSuccessUrl("/customers")
      .usernameParameter("username").passwordParameter("password");
    
    http.csrf().disable();
    http
    .authorizeRequests()
    .antMatchers("/employees").hasAnyAuthority("ADMIN")
    .antMatchers("/roles").hasAnyAuthority("ADMIN")
    .antMatchers("/customers").hasAnyAuthority("ADMIN", "USER")
    .antMatchers("/equipment").hasAnyAuthority("ADMIN", "USER")
    .antMatchers("/membershipTypes").hasAnyAuthority("ADMIN", "USER")
    .anyRequest().permitAll();
        
    http
    .logout()                                                                
        .logoutUrl("/logout")                                                 
        .logoutSuccessUrl("/login");
  }

  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(employeeService);
  }
}
