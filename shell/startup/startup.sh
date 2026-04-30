#!/bin/bash

ping -c1 1.1.1.1 && { syncthing & obsidian & spotify & konsole --new-tab --workdir /home/cuppixx/Music/ -e fish & }
konsole --new-tab --workdir /mnt/data/ -e fish
