function ShowGrafica(vlabels, vDataCarta, cDataTicket, setCarta, setTicket) {
    const ctx = document.getElementById('myChart').getContext('2d');

    const labels = vlabels;
    dsC = {};
    datasets0 = [];
    if (setCarta == true) {
        dsC = {
            label: 'carta',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: vDataCarta
        };

        datasets0 = [
            dsC
        ]
    }
    dsT = {};
    if (setTicket == true) {
        dsT = {
            label: 'ticket',
            backgroundColor: 'rgb(200, 99, 132)',
            borderColor: 'rgb(200, 99, 132)',
            data: cDataTicket
        };

        datasets0 = [
            dsT
        ]
    }

    if (setCarta == true && setTicket == true) {
        datasets0 = [
            dsC, dsT
        ]
    }

    const data = {
        labels: labels,
        datasets: datasets0
    };

    const config = {
        type: 'bar',
        data: data,
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }],
            },
        }
    };

    const myChart = new Chart(
        document.getElementById('myChart'),
        config
    );
}

function ShowGrafica2(vlabels, vPromedioTienda, vPromedio) {
    const ctx = document.getElementById('myChart2').getContext('2d');

    const labels = vlabels;

    const data = {
        labels: labels,
        datasets: [
            {
                label: 'Promedio por Sucursal',
                fill: false,
                borderColor: '#fbc658',
                backgroundColor: 'transparent',
                pointBorderColor: '#fbc658',
                pointRadius: 4,
                pointHoverRadius: 4,
                pointBorderWidth: 8,
                data: vPromedioTienda
            },
            {
                label: 'Impresiones',
                fill: false,
                borderColor: '#51CACF',
                backgroundColor: 'transparent',
                pointBorderColor: '#51CACF',
                pointRadius: 4,
                pointHoverRadius: 4,
                pointBorderWidth: 8,
                data: vPromedio,
                type: 'line',
            }
        ]
    };

    const config = {
        type: 'line',
        data: data,
        options: {
            responsive: true,
            interaction: {
                intersect: true
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }],
            },
        }
    };

    const myChart = new Chart(
        document.getElementById('myChart2'),
        config
    );
}