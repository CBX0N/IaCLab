import React, { useState, useEffect } from 'react';

function App() {
    const [timestamps, setTimestamps] = useState([]);

    useEffect(() => {
        fetch('/timestamps')
            .then(response => response.json())
            .then(data => setTimestamps(data));
    }, []);

    const addTimestamp = () => {
        fetch('/add-timestamp', { method: 'POST' })
            .then(response => response.json())
            .then(() => {
                fetch('/timestamps')
                    .then(response => response.json())
                    .then(data => setTimestamps(data));
            });
    };

    return (
        <div>
            <button onClick={addTimestamp}>Add Timestamp</button>
            <ul>
                {timestamps.map((ts, index) => (
                    <li key={index}>{ts.timestamp}</li>
                ))}
            </ul>
        </div>
    );
}

export default App;
