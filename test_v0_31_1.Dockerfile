FROM crystallang/crystal:0.31.1

WORKDIR /crystal_sample

RUN apt-get update && apt-get --assume-yes install ruby ruby-dev && gem install bundler

COPY ./crystal_sample/ .

RUN bash ./build.sh