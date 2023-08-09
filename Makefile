PWD = $(shell pwd)
XSESSIONS_DIR = /usr/share/xsessions
LOCAL_BIN_DIR = /usr/local/bin
SCRIPTS = $(PWD)/scripts
DWM_SRC = $(PWD)/dwm-src
DWMBLOCKS = $(PWD)/dwmblocks-async
MAKE_LOG = $(PWD)/make.log 2>&1

.PHONY: install make_dwm make_dwmblocks install_files

install: make_dwm make_dwmblocks install_files

make_dwm: $(DWMBLOCKS)/Makefile
	@echo -e "\e[1;34m==> Installing dwm\e[0m"
	@echo "-- compiling dwm --" > $(MAKE_LOG)
	cp -f $(DWM_SRC)/config.def.h $(DWM_SRC)/config.h
	make -C $(DWM_SRC) -f $(DWM_SRC)/Makefile >> $(MAKE_LOG)
	@echo "-- installing dwm --" >> $(MAKE_LOG)
	make -C $(DWM_SRC) -f $(DWM_SRC)/Makefile install >> $(MAKE_LOG)

make_dwmblocks: $(DWMBLOCKS)/Makefile
	@echo -e "\e[1;34m==> Installing dwmblocks\e[0m"
	cp -f $(PWD)/config-dwmblocks.h $(DWMBLOCKS)/config.h
	cp -f $(PWD)/config-dwmblocks.c $(DWMBLOCKS)/config.c
	@echo "-- installing dwmblocks --" >> $(MAKE_LOG)
	make -C $(DWMBLOCKS) -f $(DWMBLOCKS)/Makefile install >> $(MAKE_LOG)
	@echo "-- done --" >> $(MAKE_LOG)

install_files: $(XSESSIONS_DIR)/dwm.desktop $(LOCAL_BIN_DIR)/launch_dwm $(LOCAL_BIN_DIR)/dwm-run-rofi

$(DWMBLOCKS)/Makefile:
	$(error Submodule not initialized)

$(XSESSIONS_DIR)/dwm.desktop: $(PWD)/dwm.desktop
	install -Dm644 $(PWD)/dwm.desktop $(XSESSIONS_DIR)/dwm.desktop

$(LOCAL_BIN_DIR)/launch_dwm: $(PWD)/launch_dwm
	install -Dm755 $(PWD)/launch_dwm  $(LOCAL_BIN_DIR)/launch_dwm

$(LOCAL_BIN_DIR)/dwm-run-rofi: $(SCRIPTS)/dwm-run-rofi
	install -Dm755 $(SCRIPTS)/dwm-run-rofi $(LOCAL_BIN_DIR)/dwm-run-rofi
