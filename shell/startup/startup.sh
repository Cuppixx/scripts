#!/bin/bash

ping -c1 1.1.1.1 && { syncthing & obsidian & }
konsole --new-tab --workdir /mnt/data/ -e fish
