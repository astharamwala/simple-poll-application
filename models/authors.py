from db import db


class Authors(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(60))

    def __init__(self, name: str = None):
        self.name = name

    @classmethod
    def get_authors(cls):
        return cls.query.all()
