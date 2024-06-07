sudo -i
yum install java -y
curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.87/bin/apache-tomcat-9.0.87.tar.gz
tar -xzf apache-tomcat-9.0.87.tar.gz
mkdir apache-tomcat
mv ./apache-tomcat-9.0.87/* apache-tomcat
curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war
cp -rf ./student.war ./apache-tomcat/webapps/
curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/context.xml
cp -rf ./context.xml ./apache-tomcat/conf/context.xml -y
curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar
cp -rf ./mysql-connector.jar ./apache-tomcat/lib/
rm -rf student.war context.xml mysql-connector.jar apache-tomcat-9.0.87.tar.gz
./apache-tomcat/bin/catalina.sh start
