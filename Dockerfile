ARG crystal_version=latest
FROM crystallang/crystal:$crystal_version

WORKDIR /crystal_sample

RUN apt-get update && apt-get --assume-yes install ruby ruby-dev ruby-ffi
RUN crystal --version
#RUN gem install ffi

COPY ./crystal_sample/ .

RUN bash ./build.sh