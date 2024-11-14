TARGET := $(HOME)

install:
	stow --verbose --target=$(TARGET) --dir=$(PWD) .

uninstall:
	stow --verbose --target=$(TARGET) --dir=$(PWD) --delete .

reinstall: uninstall install
