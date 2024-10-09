FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    git \
    curl \
    zsh \
    vim \
    build-essential \
    cmake \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-ttf-dev \
    libsdl2-mixer-dev \
    && rm -rf /var/lib/apt/lists/*

# Set up a non-root user
ARG USERNAME=devuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Switch to the non-root user
USER $USERNAME

# Set up zsh as the default shell
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR /workspace

CMD ["/bin/zsh"]