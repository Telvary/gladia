ARG UNIFAI_DOCKER_BASE=docker.io/unifai/unifai-base:latest

FROM $UNIFAI_DOCKER_BASE AS dev

ADD clean-layer.sh  /tmp/clean-layer.sh

COPY requirements.txt /tmp/unifai-requirements.txt

RUN for package in $(cat /tmp/unifai-requirements.txt); do echo "================="; echo "installing ${package}"; echo "================="; pip3 install $package; done

#RUN pip3 install mmcv-full -f https://download.openmmlab.com/mmcv/dist/1.3.5/torch1.7.0/cu110/mmcv_full-latest%2Btorch1.7.0%2Bcu110-cp37-cp37m-manylinux1_x86_64.whl

EXPOSE 80
WORKDIR /app

RUN rm /tmp/clean-layer.sh

CMD ["sh", "-c", "echo $PWD && sh run_server_dev.sh"]

FROM scratch AS prod
#COPY --from=dev / /
COPY . /app
WORKDIR /app
CMD ["sh", "-c", "echo $PWD && sh run_server_prod.sh"]
