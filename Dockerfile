FROM drydock/u14all:{{%TAG%}}

ADD . /u14cppall

RUN /u14cppall/install.sh
