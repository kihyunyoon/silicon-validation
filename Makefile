CD = cd
CP = cp
RM = rm
CMAKE = cmake
MAKE = make

# PATH definitions
ZEPHYR_DIR := ${ZEPHYR_BASE}
WORKING_DIR := $(shell pwd)
SUBDIRS := $(ZEPHYR_DIR)

# Default definitions for BOARD and APP. It can be overrided by make command
BOARD ?= qemu_cortex_a53
APP ?= samples/hello_world

default_target: all

clean:
	@${RM} -rf ${ZEPHYR_DIR}/build

all:
	@${CD} ${ZEPHYR_DIR}; \
	${CMAKE} -B build -DZEPHYR_MODULES=${WORKING_DIR}/ext_zephyr_root -DBOARD=${BOARD} ${APP}; \
	${CD} build; \
	${MAKE}

.PHONY : clean default_target dts_gen all
