RUN pip install hide_code


RUN jupyter nbextension install hide_code --py --sys-prefix

RUN jupyter-nbextension enable hide_code --py --sys-prefix && \
    jupyter-serverextension enable hide_code --py --sys-prefix
USER $NB_USER
