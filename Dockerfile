FROM node

RUN apt-get update && apt-get install unzip

ARG SOURCE_APP_ZIP

ENV APP_HOME=/app \
    VTT_HOME=$APP_HOME/foundryvtt \
	VTT_DATA=$APP_HOME/foundrydata \
	APP_NAME=resources/app/main.js
	

RUN mkdir -p $VTT_HOME && mkdir -p $VTT_DATA && mkdir -p $VTT_DATA/Data && mkdir -p $VTT_DATA/Config && mkdir -p $VTT_DATA/Logs

ADD $SOURCE_APP_ZIP $APP_HOME/

RUN unzip -o $APP_HOME/$SOURCE_APP_ZIP -d $VTT_HOME

EXPOSE 30000/tcp
EXPOSE 30000/udp
EXPOSE 443/tcp
EXPOSE 443/udp

CMD cd $VTT_HOME && node $APP_NAME --dataPath=$VTT_DATA

