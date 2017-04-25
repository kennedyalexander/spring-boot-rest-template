package at.akmrg.springBootEmpty.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;


@Configuration
public class ServerConfig {
	
		@Bean(name = "h2Db", destroyMethod = "shutdown")
		public DataSource dataSource() {
		    return new EmbeddedDatabaseBuilder()
		    	       .generateUniqueName(true)
		               .setType(EmbeddedDatabaseType.H2)
		               .setScriptEncoding("UTF-8")
		               .ignoreFailedDrops(true)
		               .addScript("db-schema.sql")
		               .addScript("db-initalData.sql")
		               .build();
		}

	    @Bean
	    public JdbcTemplate h2JdbcTemplate(@Qualifier("h2Db") DataSource sqliteDb) { 
	        return new JdbcTemplate(sqliteDb); 
	    } 
}
