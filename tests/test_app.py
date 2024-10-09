from starlite.testing import TestClient

from algotrading.app import app


def test_greet():
    with TestClient(app=app) as client:
        response = client.get("/greet/World")
        assert response.status_code == 200
        assert response.json() == {"message": "Hello, World!"}
