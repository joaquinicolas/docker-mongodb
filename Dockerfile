FROM mongo:3.4

ENV AUTH=yes
ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh
EXPOSE 27017

CMD ["/run.sh"]