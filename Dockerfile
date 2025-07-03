FROM ubuntu:24.04

# 環境変数の設定
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# システムの更新と基本パッケージのインストール
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    tree \
    sudo \
    # 開発ツール
    build-essential \
    gcc \
    g++ \
    make \
    cmake \
    # Python環境
    python3 \
    python3-pip \
    python3-venv \
    # Node.js環境
    nodejs \
    npm \
    # その他便利ツール
    jq \
    sqlite3 \
    openssh-client \
    ca-certificates \
    # 日本語対応
    locales \
    && rm -rf /var/lib/apt/lists/*

# 日本語ロケールの設定
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# 作業ディレクトリの設定
WORKDIR /workspace

# 非rootユーザーの作成
RUN useradd -m -s /bin/bash developer && \
    echo "developer:developer" | chpasswd && \
    usermod -aG sudo developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 作業ディレクトリの権限設定
RUN chown -R developer:developer /workspace

# ユーザーの切り替え
USER developer

# シェルの設定
# RUN echo 'alias ll="ls -la"' >> ~/.bashrc && \
#     echo 'alias la="ls -la"' >> ~/.bashrc && \
#     echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc

# デフォルトコマンド
CMD ["/bin/bash"]
