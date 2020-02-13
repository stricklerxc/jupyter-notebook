#!/bin/bash

PASSWORD_SHA1=`python -c "from notebook.auth import passwd; print(passwd('${JUPYTER_PASSWORD}'))"`

# Set Jupyter Password
touch /jupyter/config/jupyter_notebook_config.py
echo "c.NotebookApp.password = u'${PASSWORD_SHA1}'" >> /jupyter/config/jupyter_notebook_config.py

# Start Notebook Server
python -m jupyter notebook \
    --ip=${JUPYTER_HOST} \
    --port=${JUPYTER_PORT} \
    --notebook-dir=${JUPYTER_NOTEBOOK_DIR} \
    --no-browser

exec "$@"
