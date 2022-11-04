BUILD_DIR=build/

init:
	meson $(BUILD_DIR)

build:
	ninja -C $(BUILD_DIR) all

ctags:
	ninja -C $(BUILD_DIR) ctags

clean:
	ninja -C $(BUILD_DIR) clean

compdb:
	ninja -C $(BUILD_DIR) -t compdb > compile_commands.json

gen-disable:
	meson configure $(BUILD_DIR) -D girgen=disabled
	meson configure $(BUILD_DIR) -D gi_docgen=disabled
	meson $(BUILD_DIR) --reconfigure

gen-enable:
	meson configure $(BUILD_DIR) -D girgen=enabled
	meson configure $(BUILD_DIR) -D gi_docgen=enabled
	meson $(BUILD_DIR) --reconfigure

doc: gen-enable
	meson compile -C $(BUILD_DIR) libproject-doc

reconfigure:
	meson $(BUILD_DIR) --reconfigure

wipe:
	meson setup --wipe $(BUILD_DIR)

install:
	ninja -C $(BUILD_DIR) install

test:
	meson test -C $(BUILD_DIR)

all: build ctags compdb

.PHONY: all build ctags compdb clean install doc test reconfigure wipe
