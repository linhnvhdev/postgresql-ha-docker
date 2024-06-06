FROM postgres:16

# Install dependancies
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv build-essential libpq-dev

# Crear virtual environemnt
RUN python3 -m venv /patroni-venv

# Activar virtual environment and install necessary dependancies
RUN /bin/bash -c "source /patroni-venv/bin/activate && \
    pip install patroni[etcd] psycopg2-binary behave coverage flake8>=3.0.0 mock pytest-cov pytest setuptools"

# Copy patroni config file
COPY ./patroni/patroni.yml /etc/patroni.yml

USER postgres

# Activate virtual env and run patroni
ENTRYPOINT ["/bin/bash", "-c", "source /patroni-venv/bin/activate && patroni /etc/patroni.yml"]
