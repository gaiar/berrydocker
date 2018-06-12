FROM resin/rpi-raspbian
MAINTAINER gaiar <gaiar@baimuratov.ru>

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 \
    && curl -sSL https://github.com/jjhelmus/berryconda/releases/download/v2.0.0/Berryconda3-2.0.0-Linux-armv7l.sh -o /tmp/berryconda.sh \
    && bash /tmp/berryconda.sh -bfp /usr/local \
    && rm -rf /tmp/berryconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

ENV PATH /opt/conda/bin:$PATH