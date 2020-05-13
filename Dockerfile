FROM python:3.7

WORKDIR /usr/src/app

# Install google cloud sdk
RUN curl -sSL https://sdk.cloud.google.com > /tmp/gcl && bash /tmp/gcl --disable-prompts
ENV PATH "/root/google-cloud-sdk/bin:$PATH"
RUN gcloud --help

# Install python dependencies
RUN apt-get update && apt-get install -y build-essential cmake gfortran
COPY requirements.txt .
RUN pip install --upgrade flake8 wheel pip
RUN pip install -r requirements.txt
