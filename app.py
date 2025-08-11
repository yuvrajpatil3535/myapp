from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({"message": "Hello from Kubernetes!"})

@app.route("/health")
def health():
    return jsonify({"status": "healthy"})

if __name__ == "__main__":
    # Production containers typically use gunicorn; this is fine for testing.
    app.run(host="0.0.0.0", port=5000)
