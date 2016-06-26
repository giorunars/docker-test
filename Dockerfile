# 1.�x�[�X�C���[�W�̎擾
FROM centos:latest

# 2.�쐬�ҏ��
MAINTAINER 0.1 giorunars.hm@gmail.com

# 3.Apache HTTP Server��PHP�̃C���X�g�[��
RUN ["yum", "-y", "install", "epel-release"]
RUN ["rpm", "-ivh", "http://rpms.famillecollet.com/enterprise/remi-release-7.rpm"]
RUN ["yum", "-y", "install", "httpd"]
RUN ["yum", "-y", "install", "--enablerepo=remi-php56", "php", "php-mbstring", "php-pear"]

# 4.Web�R���e���c�̔z�u
VOLUME ["/var/www/html"]

# 5.�|�[�g�̉��
EXPOSE 80

# 6.httpd�̎��s
CMD ["/usr/sbin/httpd","-D", "FOREGROUND"]