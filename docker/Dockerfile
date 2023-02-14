## Base Ubuntu 22.04 image
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive 
COPY wkdir /
COPY bin /usr/local/bin/
COPY tmp /tmp/
COPY code-server /home/code-server/
RUN chmod 777 /home/code-server
RUN chmod 666 /home/code-server/config.yaml
ENV APPPATH=/wkdir NODE_PATH=/usr/lib/node_modules/

WORKDIR /wkdir

# Set timezone:
RUN ln -snf /usr/share/zoneinfo/America/New_York /etc/localtime && echo America/New_York > /etc/timezone


## Required software packages
RUN apt-get -y update
RUN apt-get -y install software-properties-common python3-pip wget curl git python3 python3-dev python-is-python3
RUN apt-get -y install libcairo2-dev pkg-config awscli busybox sudo openssl vim nano

## Required Sphinx packages
RUN pip install sphinx sphinx-autobuild rstcheck[sphinx] f5_sphinx_theme recommonmark sphinx_copybutton sphinxjp.themes.sphinxjp sphinxjp.themes.basicstrap cloud_sptheme
RUN pip install virtualenv boto3 sphinx-js tornado sphinx-copybutton commonmark sphinxcontrib-nwdiag
RUN pip install sphinxcontrib-blockdiag sphinxcontrib-addmetahtml sphinxprettysearchresults sphinx-markdown-tables
RUN pip install gitpython yattag cfgv identify nodeenv pre-commit awscli sphinxcontrib-serializinghtml
RUN pip install snooty-lextudio esbonio

## Code-server and required extensions
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server --config /home/code-server/config.yaml --install-extension ms-python.python --force
RUN code-server --config /home/code-server/config.yaml --install-extension lextudio.restructuredtext --force
RUN code-server --config /home/code-server/config.yaml --install-extension ms-vscode.live-server --force
RUN code-server --config /home/code-server/config.yaml --install-extension trond-snekvik.simple-rst --force

COPY entrypoint.sh /entrypoint.sh
RUN openssl genrsa -des3 -passout pass:x -out server.pass.key 2048 && \
    openssl rsa -passin pass:x -in server.pass.key -out server.key && \
    rm server.pass.key && \
    openssl req -new -key server.key -out server.csr \
        -subj "/C=US/ST=Virgina/L=Reston/O=OrgName/OU=IT Department/CN=localhost" && \
    openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

RUN mv server* /home/code-server/

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/bin/bash"]
##ENTRYPOINT [ "/usr/bin/code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080", "--disable-telemetry"]
