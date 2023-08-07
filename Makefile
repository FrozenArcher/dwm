XSESSIONS_DIR = /usr/share/xsessions
LOCAL_BIN_DIR = /usr/local/bin
SCRIPTS = $(PWD)/scripts

.PHONY: install_files

install_files: $(XSESSIONS_DIR)/dwm.desktop $(LOCAL_BIN_DIR)/launch_dwm $(LOCAL_BIN_DIR)/dwm-run-rofi

$(XSESSIONS_DIR)/dwm.desktop: $(PWD)/dwm.desktop
	install -Dm644 $(PWD)/dwm.desktop $(XSESSIONS_DIR)/dwm.desktop

$(LOCAL_BIN_DIR)/launch_dwm: $(PWD)/launch_dwm
	install -Dm755 $(PWD)/launch_dwm  $(LOCAL_BIN_DIR)/launch_dwm

$(LOCAL_BIN_DIR)/dwm-run-rofi: $(SCRIPTS)/dwm-run-rofi
	install -Dm755 $(SCRIPTS)/dwm-run-rofi $(LOCAL_BIN_DIR)/dwm-run-rofi
