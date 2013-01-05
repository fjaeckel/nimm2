build: bundle

tomcat:
	curl -o apache-tomcat-7.0.34.tar.gz -q http://mirror3.layerjet.com/apache/tomcat/tomcat-7/v7.0.34/bin/apache-tomcat-7.0.34.tar.gz
	tar -xzpf apache-tomcat-7.0.34.tar.gz

bundle:
	GEM_HOME=vendor/bundle gem install bundler
	GEM_HOME=vendor/bundle ./vendor/bundle/bin/bundle install --deployment
	rm -rf ./tmp
	ln -sf /tmp ./tmp

clean:
	git clean -x -d -f
