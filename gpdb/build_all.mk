GPDB = gpdb
GPOPT = gp-orca gporca
GPOS = gpos
GPXERCES = gpxerces xerces gp-xerces

RESET = \033[0m
COLOR = \033[32m

.PHONY: ${GPDB} ${GPOPT} ${GPOS} ${GPXERCES}

all: init ${GPDB}
	@echo "${COLOR}Done!${RESET}"

init:
	@echo "${COLOR}Building GPDB with all dependencies...${RESET}"


${GPOS}:
	@if [ -d "$@" ]; then \
		echo "${COLOR}Building $@${RESET}"; \
		${MAKE} -C "$@/build"; \
	fi

${GPXERCES}:
	@if [ -d "$@" ]; then \
		echo "${COLOR}Building $@${RESET}"; \
		${MAKE} -C "$@"; \
	fi

${GPOPT}: ${GPOS} ${GPXERCES}
	@if [ -d "$@" ]; then \
		echo "${COLOR}Building $@${RESET}"; \
		${MAKE} -C "$@/build"; \
	fi

${GPDB}: ${GPOPT}
	@if [ -d $@ ]; then \
		echo "${COLOR}Building $@${RESET}"; \
	fi

