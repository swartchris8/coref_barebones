FROM dataflow.gcr.io/v1beta3/python:2.4.0
ENV GOOGLE_APPLICATION_CREDENTIALS="/.gcp/healx-pubmed-ingestion-7937de0b57f3.json"
RUN apt-get -qqy update -y && apt-get install -qqy lsb-release apt-transport-https curl gnupg2 libxml2-dev && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get -qqy update -y && apt-get install -qqy google-cloud-sdk
# COPY requirements.txt /docker_requirements.txt
# RUN pip install -r /docker_requirements.txt