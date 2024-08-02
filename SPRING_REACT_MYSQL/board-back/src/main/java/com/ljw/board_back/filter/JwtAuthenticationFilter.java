package com.ljw.board_back.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;
import com.ljw.board_back.provider.Jwtprovider;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter{
    
    private final Jwtprovider jwtprovider;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        

            try {

                String token = parseBearerToken(request);
                if(token == null){
                    filterChain.doFilter(request, response);
                    return;
                }    
                
                String email = jwtprovider.validate(token);
                if(email == null){
                    filterChain.doFilter(request, response);
                    return;
                }
    
                AbstractAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(email,null, AuthorityUtils.NO_AUTHORITIES);
                authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
    
                //토큰을 context에 등록
                SecurityContext securityContext = SecurityContextHolder.createEmptyContext();   //비어있는 context 생성
                securityContext.setAuthentication(authenticationToken); 
                //외부에서 사용할 수 있도록 context 등록
                SecurityContextHolder.setContext(securityContext);
            } catch (Exception e) {
                e.printStackTrace();
            }
            // 다음 filter로 넘김
            filterChain.doFilter(request, response);
           
    }

    private String parseBearerToken(HttpServletRequest request){
        String authorization = request.getHeader("Authorization");

        boolean hasAuthorization = StringUtils.hasText(authorization);
        if(!hasAuthorization) return null;

        boolean isBearer = authorization.startsWith("Bearer ");
        if(!isBearer) return null;

        String token = authorization.substring(7);
        return token;
    }

}
