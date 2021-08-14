
all: help

usage: help

help:
	@echo 'available commands: build, compress, dev, clean, help'

build:
	bash run build

compress:
	bash run compress

dev:
	bash run dev

clean:
	bash run clean

.PHONY: all usage help build compress dev clean
