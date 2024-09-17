import argparse
import logging
from datetime import timedelta
from os import environ as env

import hikari
import uvicorn
from howblox_lib import load_modules, execute_deferred_module_functions, get_environment, Environment
from howblox_lib.database import redis

#from resources.howblox import howblox
from config import CONFIG
print(CONFIG)