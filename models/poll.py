from .authors import Authors
from db import db


class Poll(db.Model):
    poll_id = db.Column(db.Integer, primary_key=True)
    author_id = db.Column(db.ForeignKey(Authors.id))

    def __init__(self, author_id: id = None):
        self.author_id = author_id

    def save(self):
        db.session.add(self)
        db.session.commit()

    @classmethod
    def total_author_poll(cls, author_id):
        return cls.query.filter_by(author_id=author_id).count()

    @classmethod
    def get_total_polls(cls):
        return cls.query.count()
