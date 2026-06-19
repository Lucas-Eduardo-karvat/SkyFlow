const params = new URLSearchParams(window.location.search);

const id = params.get("id");

fetch(`/voos/${id}/avaliacoes`)
    .then(response => response.json())
    .then(dados => {

        document.getElementById("conteudo").innerHTML = `

            <div class="card">

                <div class="card-body">

                    <h3>${dados.voo.numeroVoo}</h3>

                    <p><strong>Origem:</strong> ${dados.voo.origem.cidade}</p>

                    <p><strong>Destino:</strong> ${dados.voo.destino.cidade}</p>

                    <p><strong>Status:</strong> ${dados.voo.status}</p>

                    <p><strong>Preço:</strong> R$ ${dados.voo.preco}</p>

                    <hr>

                    <h4>Avaliações</h4>

                    ${
                        dados.avaliacoes.map(a => `
                            <div class="border rounded p-2 mb-2">
                                <strong>Nota:</strong> ${a.nota}<br>
                                <strong>Comentário:</strong> ${a.comentario}<br>
                                <strong>Sentimento:</strong> ${a.sentimento}
                            </div>
                        `).join("")
                    }

                </div>

            </div>

        `;

    });