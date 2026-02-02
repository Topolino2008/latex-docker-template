# LaTeX（texlive）を入れたイメージ
FROM debian:bookworm-slim

# LaTeX と必要ツールをインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      texlive-full \
      locales \
      git \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen

# ワークディレクトリ
WORKDIR /workspace