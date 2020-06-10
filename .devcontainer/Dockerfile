FROM perl:5-buster

ARG USERNAME=texlive
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG USER_GECOS=TeXLive

ENV PATH /usr/local/texlive/2020/bin/x86_64-linux:$PATH

RUN /bin/bash -c set -o pipefail \
    # Create user
    && groupadd --gid $USER_GID $USERNAME \
    && useradd \
      -s /bin/bash \
      --uid $USER_UID \
      --gid $USER_GID \
      -c "$USER_GECOS" \
      -m $USERNAME \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    # Add sudo support for non-root user
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    ## Install common dependencies
    && apt-get -y install --no-install-recommends \
      locales \
      less \
    # Ensure at least the en_US.UTF-8 UTF-8 locale is available.
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen \
    # Install TexLive
    && mkdir /tmp/install-tl-unx \
    && curl -L ftp://tug.org/historic/systems/texlive/2020/install-tl-unx.tar.gz \
    | tar -xz -C /tmp/install-tl-unx --strip-components=1 \
    && printf "%s\n" \
      "selected_scheme scheme-basic" \
      "tlpdbopt_install_docfiles 0" \
      "tlpdbopt_install_srcfiles 0" \
      > /tmp/install-tl-unx/texlive.profile \
    && /tmp/install-tl-unx/install-tl \
      --profile=/tmp/install-tl-unx/texlive.profile \
    && tlmgr install \
      collection-fontsrecommended \
      collection-langcjk \
      collection-langjapanese \
      collection-latexextra \
      latexmk \
    && rm -fr /tmp/install-tl-unx \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*