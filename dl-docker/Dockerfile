# FROM nvidia/12.1.0-base-ubuntu22.04
FROM nvidia/cuda:12.0.0-cudnn8-runtime-ubuntu20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV PATH="/opt/conda/bin:${PATH}"

# Set the working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends --fix-missing \
    build-essential \
    wget \
    git \
    python3 \
    python3-pip \
    ca-certificates \
    curl \
    unzip \
    vim \
    nano \
    locales \
    tzdata \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Set up Python virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install deep learning libraries and JupyterLab
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    torch torchvision torchaudio \
    jupyterlab \
    numpy \
    pandas \
    matplotlib \
    scikit-learn \
    seaborn

# Download and install frp
RUN wget https://github.com/fatedier/frp/releases/download/v0.48.0/frp_0.48.0_linux_amd64.tar.gz && \
    tar -zxf frp_0.48.0_linux_amd64.tar.gz && \
    mv frp_0.48.0_linux_amd64/frpc /usr/local/bin && \
    rm frp_0.48.0_linux_amd64.tar.gz

COPY frpc.ini /etc/frp/frpc.ini

# Expose the JupyterLab port
EXPOSE 8888

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord"]
