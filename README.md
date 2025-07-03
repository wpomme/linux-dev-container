# mac container: build
container build -t linux-dev .

# start container
container run -it --rm linux-dev

# start container with volume mount (macのファイルを共有)
container run -it --rm -v $(pwd):/workspace linux-dev
