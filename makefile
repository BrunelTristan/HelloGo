MAKEFLAGS += --no-print-directory
EXEC=first
SRCDIR=./
DEP_FILE=deps
TST_FILES=$(wildcard $(SRCDIR)/*/*/*_test.go $(SRCDIR)/*/*_test.go $(SRCDIR)/*_test.go)
SRC_FILES=$(wildcard $(SRCDIR)/*/*/*.go $(SRCDIR)/*/*.go $(SRCDIR)/*.go)
SRC1= $(filter-out $(wildcard $(SRCDIR)/*_test.go), $(SRC_FILES))
SRC2= $(filter-out $(wildcard $(SRCDIR)/*/*_test.go), $(SRC1))
SRC= $(filter-out $(wildcard $(SRCDIR)/*/*/*_test.go), $(SRC2))

.PHONY: all clear 

all: displayCompilation $(EXEC) run-tests code-analysis list-todo 

$(EXEC): $(DEP_FILE) $(SRC) makefile
	go fmt $(SRC_FILES)
	go build -o $@ $(SRC)

displayCompilation:
	@echo "${_RED}  --COMPILATION ${_END}"

$(DEP_FILE): go.mod go.sum
	go mod download
	go mod verify
	touch $(DEP_FILE)

code-analysis:
	go vet ./...
	golangci-lint run --enable-all

clear: clean
	rm -rf $(EXEC)
	
run-tests: $(TST_FILES)
	@echo "${_RED}  --LAUNCH TESTS ${_END}"
	go test -cover -v ./...
	go test -bench=. ./...

list-todo:
	@echo "${_RED}  --LOOKING FOR TODO ${_END}"
	@grep -I -ri 'todo ' $(SRCDIR) | grep -v 'makefile:' || true
