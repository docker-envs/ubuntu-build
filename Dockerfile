FROM ubuntu:16.04
LABEL author="Lu Wu"

RUN groupadd --gid 1000 luwu \
    && useradd --uid 1000 --gid luwu --shell /bin/bash --create-home luwu \
    && usermod -s /bin/bash root

ENV LANG en_US.UTF-8

RUN mkdir /workspace  && \
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get clean && \
    apt-get update --fix-missing && \
    apt-get install -y locales vim bash-completion procps apt-transport-https vim iproute2 net-tools build-essential ca-certificates curl wget software-properties-common git uuid-dev telnet dnsmasq && \
    locale-gen en_US.UTF-8 && \
    # echo '# 添加vim对中文的支持' >> ~/.vimrc && \
    echo 'set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1' >> /etc/vim/vimrc && \
    echo 'set termencoding=utf-8' >> etc/vim/vimrc && \
    echo 'set fileformats=unix' >> etc/vim/vimrc && \
    echo 'set encoding=utf-8' >> etc/vim/vimrc

