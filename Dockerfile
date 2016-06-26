# 1.ベースイメージの取得
FROM centos:latest

# 2.作成者情報
MAINTAINER 0.1 giorunars.hm@gmail.com

# 3.Apache HTTP ServerとPHPのインストール
RUN ["yum", "-y", "install", "epel-release"]
RUN ["rpm", "-ivh", "http://rpms.famillecollet.com/enterprise/remi-release-7.rpm"]
RUN ["yum", "-y", "install", "httpd"]
RUN ["yum", "-y", "install", "--enablerepo=remi-php56", "php", "php-mbstring", "php-pear"]

# 4.Webコンテンツの配置
VOLUME ["/var/www/html"]

# 5.ポートの解放
EXPOSE 80

# 6.httpdの実行
CMD ["/usr/sbin/httpd","-D", "FOREGROUND"]