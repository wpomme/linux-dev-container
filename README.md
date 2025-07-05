# linux development container
linuxでCLI環境を構築するためのコンテナー

## mac container
将来[Mac container](https://github.com/apple/container) を使うためのコマンドリスト。現在はdockerを使用している。dockerコマンドでコンテナーを立ち上げる場合は、`container`をそのまま`docker`に置き換える。

### mac container: build
```bash
container build -t linux-dev .
```

### start container
```bash
container run -it --rm linux-dev
```

### start container with volume mount (macのファイルを共有)
```bash
container run -it --rm -v $(pwd):/workspace linux-dev
```
