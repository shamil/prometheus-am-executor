export TMPDIR := /tmp
export GOPATH := $(TMPDIR)/prometheus-am-executor-go
export GOBIN  := $(GOPATH)/bin

.PHONY = test deps build all

deps:
	@echo "==> Upgrading dependencies..."
	@go get -t -u ./...
	@go mod tidy

build: deps
	@echo "==> Building ..."
	@go build -o $(GOBIN)/prometheus-am-executor

test: build
	@echo "==> Running tests ..."
	@go test
	@scripts/integration

all: test build
