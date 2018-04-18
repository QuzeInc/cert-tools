FROM alpine:3.5

COPY . /cert-tools

RUN apk add --update \
	bash \
	python3 \
	python3-dev \
	&& python3 -m ensurepip \
	&& pip3 install --upgrade pip setuptools \
	&& pip3 install awscli --upgrade

RUN pip install /cert-tools
CMD sh cert-tools/start.sh

