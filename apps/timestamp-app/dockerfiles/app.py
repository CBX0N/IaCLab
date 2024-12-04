from flask import Flask, jsonify, request
import sqlite3

app = Flask(__name__)

# Database connection
def get_db_connection():
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/add-timestamp', methods=['POST'])
def add_timestamp():
    conn = get_db_connection()
    conn.execute('INSERT INTO timestamps (timestamp) VALUES (CURRENT_TIMESTAMP)')
    conn.commit()
    conn.close()
    return jsonify({'message': 'Timestamp added successfully!'})

@app.route('/timestamps', methods=['GET'])
def get_timestamps():
    conn = get_db_connection()
    timestamps = conn.execute('SELECT * FROM timestamps').fetchall()
    conn.close()
    return jsonify([dict(row) for row in timestamps])

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
