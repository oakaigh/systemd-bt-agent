SYSTEMD_UNIT_DIR := /etc/systemd/system

install:
	sudo cp --interactive agent.conf /etc/bluetooth/
	sudo cp bt-agent.service $(SYSTEMD_UNIT_DIR)

deploy: install
	sudo systemctl stop bt-agent.service
	sudo systemctl daemon-reload
	sudo systemctl enable --now bt-agent.service
