FROM ruby:3.1.2

RUN apt-get update

RUN apt-get install -y libaio1 wget unzip curl sudo build-essential cron --no-install-recommends apt-utils

RUN apt-get install -y locales locales-all --no-install-recommends apt-utils

ENV LC_ALL pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8

# If use ppa
#RUN apt-get install software-properties-common -y

# Fix certificate issues
#RUN apt-get install ca-certificates-java -y && \
#   update-ca-certificates -f;

#instalando fontes
#RUN apt purge ttf-mscorefonts-installer
#RUN wget http://ftp.de.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb -P ~/Downloads
#RUN apt install ~/Downloads/ttf-mscorefonts-installer_3.6_all.deb -y --no-install-recommends apt-utils
#RUN rm -rf ~/Downloads/ttf-mscorefonts-installer_3.6_all.deb

# Postgres dev packages
RUN apt-get install -y libpq-dev

# Mariadb dev packages
RUN apt-get install -y libmariadbd-dev

# Mysql dev packages
RUN apt-get install -y default-mysql-client default-libmysqlclient-dev


# instalando nodejs e yarn
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
RUN apt-get install nodejs -y --no-install-recommends apt-utils

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install yarn -y

RUN apt-get autoremove -y && apt-get clean

RUN rm -rf /var/lib/apt/lists/*

RUN gem install bundler
# RUN gem install rails

RUN mkdir /app

COPY app /app

COPY start.sh /

EXPOSE 3000

CMD ["/bin/bash", "/start.sh"]