FROM ubuntu:16.04

ENV BUILD_PACKAGES git wget bash make gcc g++ gnupg software-properties-common build-essential python3.6 python3.6-dev python3-pip python3.6-venv nodejs python3 nginx tmux python3-zmq lynx htop
ENV NPM_PACKAGES wait-port yarn ts-node tslint typescript

RUN apt-get update && \
        apt-get install -y software-properties-common curl && \
        add-apt-repository ppa:jonathonf/python-3.6 && \
        curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get update -y && \
        apt-get install -y $BUILD_PACKAGES && \
        rm -rf /var/lib/apt/lists/*

RUN npm install -g -s --no-progress $NPM_PACKAGES

# update pip
RUN python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel
RUN pip3 install plyvel

RUN ln -sf /bin/bash /bin/sh

WORKDIR /root
RUN git clone https://github.com/xludx/coldstakepool.git
WORKDIR /root/coldstakepool
RUN git checkout dockerize
COPY ./bin/entrypoint.sh /root/coldstakepool/bin/entrypoint.sh
RUN chmod +x bin/entrypoint.sh
RUN pip3 install .


