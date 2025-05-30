document.getElementById('cep').addEventListener('blur', function() {
    var cep = this.value.replace(/\D/g, '');
    if (cep.length !== 8) {
        //alert('CEP inválido. Deve conter 8 dígitos.');
        return;
    }

    fetch(`https://viacep.com.br/ws/${cep}/json/`)
        .then(response => {
            if (!response.ok) throw new Error('Failed to CEP');
            return response.json();
        })
        .then(data => {
            if (data.erro) {
                alert('CEP not found');
                document.getElementById('address').value = 'not found';
            } else {
                const address = `${data.logradouro}, ${data.bairro}, ${data.localidade} - ${data.uf}`;
                document.getElementById('address').value = address;
            }
        })
        .catch(error => {
            console.error('Error searching CEP:', error);
            alert('Error searching CEP.');
        });
});