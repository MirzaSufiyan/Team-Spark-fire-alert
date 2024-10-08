<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Live Plot Graphs</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment@1.0.0"></script>
    <style>
        .chart-container {
            width: 100%;
            max-width: 600px;
            margin: auto;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="chart-container">
        <canvas class="temperatureChart" width="400" height="200"></canvas>
        <canvas class="humidityChart" width="400" height="200"></canvas>
        <canvas class="smokeChart" width="400" height="200"></canvas>
    </div>

    <script>
        const temperatureCtx = document.querySelector('.temperatureChart').getContext('2d');
        const humidityCtx = document.querySelector('.humidityChart').getContext('2d');
        const smokeCtx = document.querySelector('.smokeChart').getContext('2d');

        const temperatureChart = new Chart(temperatureCtx, {
            type: 'line',
            data: {
                labels: [],
                datasets: [{
                    label: 'Temperature',
                    data: [],
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
                    tension: 0.1, // Smooth curves
                    fill: false // No fill under the line
                }]
            },
            options: {
                animation: {
                    duration: 0 // Disable animations
                },
                scales: {
                    x: {
                        type: 'time',
                        time: {
                            unit: 'second'
                        },
                        title: {
                            display: true,
                            text: 'Time'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Temperature (°C)'
                        }
                    }
                }
            }
        });

        const humidityChart = new Chart(humidityCtx, {
            type: 'line',
            data: {
                labels: [],
                datasets: [{
                    label: 'Humidity',
                    data: [],
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                    tension: 0.1, // Smooth curves
                    fill: false // No fill under the line
                }]
            },
            options: {
                animation: {
                    duration: 0 // Disable animations
                },
                scales: {
                    x: {
                        type: 'time',
                        time: {
                            unit: 'second'
                        },
                        title: {
                            display: true,
                            text: 'Time'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Humidity (%)'
                        }
                    }
                }
            }
        });

        const smokeChart = new Chart(smokeCtx, {
            type: 'line',
            data: {
                labels: [],
                datasets: [{
                    label: 'Smoke',
                    data: [],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                    tension: 0.1, // Smooth curves
                    fill: false // No fill under the line
                }]
            },
            options: {
                animation: {
                    duration: 0 // Disable animations
                },
                scales: {
                    x: {
                        type: 'time',
                        time: {
                            unit: 'second'
                        },
                        title: {
                            display: true,
                            text: 'Time'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Smoke Level'
                        }
                    }
                }
            }
        });

        function fetchDataAndUpdateCharts() {
            fetch('liveMonitorData.jsp') // Ensure this path is correct
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.length > 0) {
                        const timestamps = data.map(entry => new Date(entry.timestamp));
                        const temperatures = data.map(entry => entry.temperature);
                        const humidities = data.map(entry => entry.humidity);
                        const smokes = data.map(entry => entry.smoke);

                        updateChart(temperatureChart, timestamps, temperatures);
                        updateChart(humidityChart, timestamps, humidities);
                        updateChart(smokeChart, timestamps, smokes);
                    }
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                });
        }

        function updateChart(chart, labels, data) {
            // Remove old data if limit is reached
            if (chart.data.labels.length >= 50) { // Limit number of data points to 50
                chart.data.labels.shift(); // Remove the first label
                chart.data.datasets[0].data.shift(); // Remove the first data point
            }
            chart.data.labels.push(...labels);
            chart.data.datasets[0].data.push(...data);
            chart.update();
        }

        // Fetch data and update the charts every 5 seconds
        setInterval(fetchDataAndUpdateCharts, 5000);

        // Initial fetch
        fetchDataAndUpdateCharts();
    </script>
</body>
</html>
