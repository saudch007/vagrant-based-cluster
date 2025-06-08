from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

@app.route('/get', methods=['GET'])
def get_data():
    try:
        conn = psycopg2.connect(
            host="192.168.56.101",
            port=5432,
            database="apidb",
            user="apiuser",
            password="secret"
        )
        cur = conn.cursor()
        cur.execute("SELECT 'Hello from DB!'")
        result = cur.fetchone()
        cur.close()
        conn.close()
        return jsonify({"message": result[0]})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
