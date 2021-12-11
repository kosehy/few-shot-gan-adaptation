FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-runtime

ENV APP_HOME /app
COPY requirements.txt ${APP_HOME}/

RUN apt-get update \
  && apt-get install -y \
  wget \
  g++ \
  libxml2 \
  && conda install -c conda-forge cudatoolkit-dev \
  && pip install --no-cache-dir -r ${APP_HOME}/requirements.txt

COPY . ${APP_HOME}
WORKDIR ${APP_HOME} 
