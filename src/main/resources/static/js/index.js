document.addEventListener("DOMContentLoaded", () => {

    fetch("/voos")
        .then(response => response.json())
        .then(voos => {

            const tabela = document.getElementById("tabelaVoos");

            voos.forEach(voo => {

                tabela.innerHTML += `
                    <tr>

                        <td>${voo.numeroVoo}</td>

                        <td>${voo.origem.cidade}</td>

                        <td>${voo.destino.cidade}</td>

                        <td>R$ ${Number(voo.preco).toFixed(2)}</td>

                        <td>${voo.status}</td>

                        <td>

                            <a href="detalhes.html?id=${voo.id}"
                               class="btn btn-primary btn-sm">

                                Ver detalhes

                            </a>

                        </td>

                    </tr>
                `;

            });

        })
        .catch(error => {

            console.error(error);

            alert("Erro ao carregar os voos.");

        });

});