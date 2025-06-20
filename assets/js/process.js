
window.addEventListener('DOMContentLoaded', () => {
  fetch('/assets/data/Table_Input.csv')
    .then(response => response.text())
    .then(text => {
      const lines = text.trim().split('\n').map(line => line.split(','));
      let html = '<table><tr><th>' + lines[0][0] + '</th><th>' + lines[0][1] + '</th></tr>';
      let map = {};
      for (let i = 1; i < lines.length; i++) {
        const key = lines[i][0].trim();
        const val = parseFloat(lines[i][1]);
        map[key] = val;
        html += '<tr><td>' + key + '</td><td>' + val + '</td></tr>';
      }
      html += '</table>';
      document.getElementById('table1').innerHTML = html;

      let a5 = map['A5'], a7 = map['A7'], a12 = map['A12'], a13 = map['A13'], a15 = map['A15'], a20 = map['A20'];
      let alpha = a5 + a20;
      let beta = (a7 !== 0) ? (a15 / a7) : 'Undefined';
      let charlie = a13 * a12;

      const t2 = `<table><tr><th>Category</th><th>Value</th></tr>
        <tr><td title="A5 + A20">Alpha</td><td>${alpha}</td></tr>
        <tr><td title="A15 / A7">Beta</td><td>${beta}</td></tr>
        <tr><td title="A13 * A12">Charlie</td><td>${charlie}</td></tr></table>`;
      document.getElementById('table2').innerHTML = t2;

      const ctx = document.getElementById('chartCanvas');
      new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ['Alpha', 'Beta', 'Charlie'],
          datasets: [{
            label: 'Computed Values',
            data: [alpha, beta, charlie],
            backgroundColor: ['#66bb6a', '#42a5f5', '#ef5350']
          }]
        }
      });

      window.downloadCSV = () => {
        const csv = `Category,Value\nAlpha,${alpha}\nBeta,${beta}\nCharlie,${charlie}`;
        const blob = new Blob([csv], { type: 'text/csv' });
        const a = document.createElement('a');
        a.href = URL.createObjectURL(blob);
        a.download = 'table2.csv';
        a.click();
      };
    });
});
