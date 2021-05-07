import json
import os

import flask
from flask_sqlalchemy import SQLAlchemy

app = flask.Flask('Poll Application')
app.secret_key = 'A0Zrdqwf1AQWj12ajkhgFN]dddd/,?RfDWQQT'
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 43200  # 12 hour: set the cache control max age
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:postgres@localhost/postgres"
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = json.loads(os.environ.get('DATABASE_ENGINE_OPTIONS', '{"pool_pre_ping": true}'))
db = SQLAlchemy(app)
