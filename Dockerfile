FROM ubuntu:latest
RUN apt-get update && apt-get -y update
RUN apt-get install -y build-essential python3.6 python3-pip python3-dev
RUN pip3 -q install pip --upgrade
RUN mkdir src
WORKDIR src/
COPY . .
RUN pip3 install jupyter 

RUN pip3 install pandas \
	qgrid \
	hide_code \ 
	matplotlib \
	numpy \
	xlrd
	

#USER root

RUN jupyter nbextension install hide_code --py --sys-prefix
RUN jupyter-nbextension enable hide_code --py --sys-prefix 
#    jupyter-serverextension enable hide_code --py --sys-prefix

    
RUN jupyter nbextension install qgrid --py --sys-prefix
RUN jupyter-nbextension enable --py --sys-prefix qgrid
#    jupyter-serverextension enable qgrid --py --sys-prefix
    
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]





<<<<<<< Updated upstream
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
=======
CMD ["jupyter", "notebook", "--no-browser", "--ip='0.0.0.0'"]
>>>>>>> Stashed changes
