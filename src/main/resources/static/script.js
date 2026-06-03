const selectPaises  = document.getElementById('paises');
const selectEstados = document.getElementById('estados');
const selectCidades = document.getElementById('cidades');

// Busca países ao carregar
fetch('http://localhost:8081/localizacao/paises')
    .then(resposta => resposta.json())
    .then(paises => {
        paises.forEach(pais => {
            const option = document.createElement('option');
            option.value = pais.id;
            option.textContent = pais.nome;
            selectPaises.appendChild(option);
        });
    });

// Busca estados baseado no país selecionado
selectPaises.addEventListener('change', () => {
    const idPais = selectPaises.value;

    selectEstados.innerHTML = '<option value="">Selecione um estado</option>';
    selectCidades.innerHTML = '<option value="">Selecione uma cidade</option>';
    selectEstados.disabled = true;
    selectCidades.disabled = true;

    if (!idPais) return;

    fetch(`http://localhost:8081/localizacao/paises/${idPais}/estados`)
        .then(resposta => resposta.json())
        .then(estados => {
            estados.forEach(estado => {
                const option = document.createElement('option');
                option.value = estado.id;
                option.textContent = estado.nome;
                selectEstados.appendChild(option);
            });
            selectEstados.disabled = false;
        });
});

// Busca cidades baseado no estado selecionado
selectEstados.addEventListener('change', () => {
    const idEstado = selectEstados.value;

    selectCidades.innerHTML = '<option value="">Selecione uma cidade</option>';
    selectCidades.disabled = true;

    if (!idEstado) return;

    fetch(`http://localhost:8081/localizacao/estados/${idEstado}/cidades`)
        .then(resposta => resposta.json())
        .then(cidades => {
            cidades.forEach(cidade => {
                const option = document.createElement('option');
                option.value = city => cidade.id; // Correção sutil se seu JSON bindar como id
                option.value = cidade.id;
                option.textContent = cidade.nome;
                selectCidades.appendChild(option);
            });
            selectCidades.disabled = false;
        });
});