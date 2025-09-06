TARGET := $(HOME)

# Detect OS
UNAME_S := $(shell uname -s)

MACOS_IGNORE := hypr|waybar
LINUX_IGNORE := aerospace|sketchybar
ALL_OS_IGNORE := aerospace|sketchybar|hypr|waybar

install:
ifeq ($(UNAME_S),Darwin)
	@echo "Installing dotfiles for macOS..."
	stow --verbose --target=$(TARGET) --ignore='\.config/($(MACOS_IGNORE))' .
else ifeq ($(UNAME_S),Linux)
	@echo "Installing dotfiles for Linux..."
	stow --verbose --target=$(TARGET) --ignore='\.config/($(LINUX_IGNORE))' --ignore='Brewfile' .
else
	@echo "Unknown OS, installing common dotfiles only..."
	stow --verbose --target=$(TARGET) --ignore='\.config/($(ALL_OS_IGNORE))' --ignore='Brewfile' .
endif

uninstall:
ifeq ($(UNAME_S),Darwin)
	@echo "Uninstalling dotfiles for macOS..."
	stow --verbose --target=$(TARGET) --delete --ignore='\.config/($(MACOS_IGNORE))' .
else ifeq ($(UNAME_S),Linux)
	@echo "Uninstalling dotfiles for Linux..."
	stow --verbose --target=$(TARGET) --delete --ignore='\.config/($(LINUX_IGNORE))' --ignore='Brewfile' .
else
	@echo "Unknown OS, uninstalling common dotfiles only..."
	stow --verbose --target=$(TARGET) --delete --ignore='\.config/($(ALL_OS_IGNORE))' --ignore='Brewfile' .
endif

install-macos:
	@echo "Force installing macOS dotfiles..."
	stow --verbose --target=$(TARGET) --ignore='\.config/($(MACOS_IGNORE))' .

install-linux:
	@echo "Force installing Linux dotfiles..."
	stow --verbose --target=$(TARGET) --ignore='\.config/($(LINUX_IGNORE))' --ignore='Brewfile' .

install-common:
	@echo "Installing common dotfiles only..."
	stow --verbose --target=$(TARGET) --ignore='\.config/($(ALL_OS_IGNORE))' --ignore='Brewfile' .

reinstall: uninstall install
