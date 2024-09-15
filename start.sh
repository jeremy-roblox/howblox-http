#!/bin/sh
source .venv/bin/activate
# ssh -R local.howblox:80:localhost:8010 localhost.run &
python3.12 src/bot.py --debug