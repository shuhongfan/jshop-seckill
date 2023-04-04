package com.sugo.seckill.web.config;

import org.apache.catalina.connector.Connector;
import org.apache.coyote.ProtocolHandler;
import org.apache.coyote.http11.Http11NioProtocol;
import org.springframework.boot.web.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.ConfigurableWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.stereotype.Component;

/**
 * @ClassName WebServerConfig
 * @Description 对web服务器进行定制化开发，对keepalive进行设置
 * @Author hubin
 * @Date 2021/1/22 22:56
 * @Version V1.0
 **/
@Component
public class WebServerConfig implements WebServerFactoryCustomizer<ConfigurableWebServerFactory>{

    // 定制tomcat服务器
    @Override
    public void customize(ConfigurableWebServerFactory configurableWebServerFactory) {

        ((TomcatServletWebServerFactory)configurableWebServerFactory).addConnectorCustomizers(new TomcatConnectorCustomizer() {

            // 获取tomcat连接器
            @Override
            public void customize(Connector connector) {
                // 获取protocol
                Http11NioProtocol protocolHandler = (Http11NioProtocol) connector.getProtocolHandler();
                // 如果keepalive连接30s，还没有人使用，释放此链接
                protocolHandler.setKeepAliveTimeout(30000);
                // 允许开启最大长连接数量,4cpu,8gb
                protocolHandler.setMaxKeepAliveRequests(10000);

            }
        });

    }
}

