FROM ruby:3.0.2

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-key update \
  && apt-get update -qq \
  && apt-get install -y fonts-noto-cjk \
  && apt-get install -y --no-install-recommends build-essential libpq-dev postgresql nodejs yarn less \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && sed -i 's/DEFAULT@SECLEVEL=2/DEFAULT@SECLEVEL=1/' /etc/ssl/openssl.cnf

WORKDIR /app

COPY . .
RUN mkdir -p tmp/sockets