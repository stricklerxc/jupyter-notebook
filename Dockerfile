FROM python:3-slim

ARG USER=jupyter

ENV JUPYTER_HOST=0.0.0.0
ENV JUPYTER_PORT=8888
ENV JUPYTER_WORKSPACE=/jupyter
ENV JUPYTER_NOTEBOOK_DIR=${JUPYTER_WORKSPACE}/notebooks
ENV JUPYTER_CONFIG_DIR=${JUPYTER_WORKSPACE}/config
ENV JUPYTER_RUNTIME_DIR=${JUPYTER_WORKSPACE}/runtime
ENV JUPYTER_DATA_DIR=${JUPYTER_WORKSPACE}/data
ENV JUPYTER_PASSWORD=jupyter

USER root

RUN pip install jupyter pandas numpy matplotlib && \
    useradd -ms /bin/bash ${USER} && \
    mkdir -p ${JUPYTER_NOTEBOOK_DIR} && \
    mkdir -p ${JUPYTER_CONFIG_DIR} && \
    chown --recursive ${USER}:${USER} ${JUPYTER_WORKSPACE}

USER ${USER}

COPY entrypoint.sh /usr/local/bin/

VOLUME ${JUPYTER_WORKSPACE}

EXPOSE ${JUPYTER_PORT}

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
