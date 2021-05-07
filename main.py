try:
    import orjson as json
except ImportError:
    import json

import flask
from flask import jsonify, request

from db import app, db
from models.authors import Authors
from models.poll import Poll


@app.route('/')
def home():
    authors = Authors.get_authors()
    return flask.render_template(
        'index.html',
        authors=authors
    )


@app.route('/poll_results')
def fetch_poll_data():
    authors = Authors.get_authors()
    poll_details = {}
    votes = []
    for author in authors:
        votes.append(Poll.total_author_poll(author.id))
        poll_details.update({author.name: votes[len(votes)-1]})
    return flask.render_template(
        'result.html',
        authors=authors,
        poll_details=poll_details,
        total_poll=Poll.get_total_polls(),
        highest_vote = max(votes)
    )


@app.route('/save_poll', methods=['POST'])
def save_poll():
    try:
        data = json.loads(request.data)
    except json.JSONDecodeError as e:
        return jsonify({"message": e})
    author_id = data.get("author_id")
    Poll(author_id).save()
    return jsonify({"message": "Vote saved successfully!"})


if __name__ == "__main__":
    app.run("0.0.0.0", "9000", True)

