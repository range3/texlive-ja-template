FROM buildpack-deps:trixie-curl

ARG USERNAME=texlive
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG USER_GECOS=TeXLive

ENV TZ Asia/Tokyo

RUN \
  # Common packages
  export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ssh \
    less \
    tree \
    git \
    vim \
    make \
    apt-file \
  # Create a non-root user
  && groupadd --gid $USER_GID $USERNAME \
  && useradd \
    -s /bin/bash \
    --uid $USER_UID \
    --gid $USER_GID \
    -c "$USER_GECOS" \
    -m $USERNAME \
  # Add sudo support for non-root user
  && apt-get install -y --no-install-recommends \
    sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  # locale
  && apt-get install -y --no-install-recommends \
    locales \
  && sed -i -E 's/# (en_US.UTF-8)/\1/' /etc/locale.gen \
  && sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen \
  && locale-gen \
  # timezone
  && apt-get install -y --no-install-recommends \
    tzdata \
  && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
  && dpkg-reconfigure tzdata \
  # Clean up
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# install TexLive for Japanese
RUN \
  export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    texlive-lang-japanese \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-luatex \
    texlive-xetex \
    texlive-extra-utils \
    texlive-publishers \
    texlive-science \
    latex-cjk-common \
    fonts-lmodern \
    ghostscript \
    xzdec \
    perl \
    cpanminus \
    latexmk \
    xz-utils \
  # Install perl modules for latexindent
  && cpanm \
    YAML::Tiny \
    File::HomeDir \
  # Clean up
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

USER ${USERNAME}
RUN \
  # setup tlmgr for usermode
  tlmgr init-usertree 

USER root
