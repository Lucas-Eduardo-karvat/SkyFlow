/**
 * SKYPASS – script.js
 * ============================================================
 * Toda chamada de API está marcada com comentários:
 *   // API: [MÉTODO] [endpoint]
 *   // PAYLOAD: { ... }
 *   // RESPOSTA: { ... }
 *
 * Para integrar com o backend Java (Spring Boot):
 *   - Defina BASE_URL apontando para o servidor
 *   - Implemente os endpoints listados
 *   - As avaliações usam MongoDB (ver seção Avaliações)
 * ============================================================
 */

'use strict';

/* ============================================================
   CONFIGURAÇÃO DE API
   ============================================================ */
const API = {
  BASE_URL: 'http://localhost:8080/api', // <- Altere para a URL do seu backend

  // Monta URL completa
  url(path) { return `${this.BASE_URL}${path}`; },

  // Fetch genérico com tratamento de erros
  async get(path) {
    const res = await fetch(this.url(path), {
      headers: { 'Content-Type': 'application/json' }
    });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return res.json();
  },

  async post(path, body) {
    const res = await fetch(this.url(path), {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return res.json();
  },

  async put(path, body) {
    const res = await fetch(this.url(path), {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return res.json();
  },

  async delete(path) {
    const res = await fetch(this.url(path), { method: 'DELETE' });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return res.json();
  }
};

/* ============================================================
   DADOS MOCK (usados enquanto o backend não existe)
   Remova ou comente esta seção após integrar com o backend.
   ============================================================ */
const MOCK = {
  voos: [
    {
      id: 'VOO001',
      companhia: 'Azul Linhas Aéreas',
      sigla: 'AZ',
      numeroVoo: 'AD4501',
      aeronave: 'Boeing 737-800',
      origem: 'GRU', horaPartida: '06:15',
      destino: 'GIG', horaChegada: '07:25',
      duracao: '1h 10min',
      tipo: 'Direto',
      preco: 289.00,
      classe: 'Economica',
      amenidades: ['wifi', 'bagagem23kg', 'usb']
    },
    {
      id: 'VOO002',
      companhia: 'Gol Linhas Aéreas',
      sigla: 'GL',
      numeroVoo: 'G31080',
      aeronave: 'Airbus A320',
      origem: 'GRU', horaPartida: '09:40',
      destino: 'GIG', horaChegada: '12:35',
      duracao: '2h 55min',
      tipo: '1 escala (VCP)',
      preco: 198.00,
      classe: 'Economica',
      amenidades: ['bagagem10kg']
    },
    {
      id: 'VOO003',
      companhia: 'LATAM Airlines',
      sigla: 'LA',
      numeroVoo: 'LA3045',
      aeronave: 'Boeing 737 MAX',
      origem: 'GRU', horaPartida: '14:30',
      destino: 'GIG', horaChegada: '15:45',
      duracao: '1h 15min',
      tipo: 'Direto',
      preco: 345.00,
      classe: 'Economica',
      amenidades: ['wifi', 'bagagem23kg', 'almoco']
    }
  ],

  reserva: {
    codigo: 'SKY001',
    status: 'CONFIRMADA',
    vooIda: {
      companhia: 'Azul Linhas Aéreas',
      sigla: 'AZ',
      numeroVoo: 'AD4501',
      origem: 'GRU', horaPartida: '06:15',
      destino: 'GIG', horaChegada: '07:25',
      data: '12/06/2025',
      tipo: 'Direto'
    },
    passageiros: [
      { nome: 'JOÃO SILVA', cpf: '***.***.***-01', assento: '12A', tipo: 'Adulto' }
    ],
    valores: [
      { descricao: 'Passagem (1 adulto)', valor: 289.00 },
      { descricao: 'Taxas aeroportuárias', valor: 48.00 },
      { descricao: 'Total', valor: 337.00 }
    ]
  },

  ranking: [
    { companhia: 'LATAM Airlines', sigla: 'LA', mediaGeral: 4.7, totalAvaliacoes: 312 },
    { companhia: 'Azul Linhas Aéreas', sigla: 'AZ', mediaGeral: 4.4, totalAvaliacoes: 198 },
    { companhia: 'Gol Linhas Aéreas', sigla: 'GL', mediaGeral: 3.9, totalAvaliacoes: 245 }
  ],

  avaliacoesRecentes: [
    {
      id: 'AV001',
      autor: 'Maria Costa',
      companhia: 'LATAM Airlines',
      vooId: 'LA3045',
      mediaGeral: 5,
      comentario: 'Voo excelente, pontual e tripulação muito atenciosa.',
      data: '22/05/2026'
    },
    {
      id: 'AV002',
      autor: 'Carlos Mendes',
      companhia: 'Azul Linhas Aéreas',
      vooId: 'AD4501',
      mediaGeral: 4,
      comentario: 'Boa experiência no geral, leve atraso na saída.',
      data: '18/05/2026'
    },
    {
      id: 'AV003',
      autor: 'Ana Rodrigues',
      companhia: 'Gol Linhas Aéreas',
      vooId: 'G31080',
      mediaGeral: 3,
      comentario: 'Custo bom, mas Wi-Fi indisponível durante todo o voo.',
      data: '15/05/2026'
    }
  ]
};

/* ============================================================
   ESTADO DA APLICAÇÃO
   ============================================================ */
const STATE = {
  paginaAtual: 'voos',
  tipoViagem: 'ida-volta',
  avaliacoes: {
    pontualidade: 0,
    conforto: 0,
    atendimento: 0,
    custo: 0
  },
  quickStarValue: 0,
  checkinPassageiros: [],
  assentoSelecionado: null,
  trechoCount: 1
};

/* ============================================================
   NAVEGAÇÃO ENTRE PÁGINAS
   ============================================================ */
function showPage(pageName) {
  // Esconde todas as páginas
  document.querySelectorAll('.page').forEach(p => {
    p.classList.remove('active');
    p.classList.add('hidden');
  });

  // Mostra a página selecionada
  const page = document.getElementById(`page-${pageName}`);
  if (page) {
    page.classList.remove('hidden');
    page.classList.add('active');
  }

  // Atualiza nav links ativos
  document.querySelectorAll('.nav-link').forEach(link => {
    link.classList.toggle('active', link.dataset.page === pageName);
  });

  STATE.paginaAtual = pageName;

  // Fecha menu mobile se aberto
  fecharMenuMobile();

  // Scroll to top
  window.scrollTo({ top: 0, behavior: 'smooth' });

  // Carrega dados específicos da página
  if (pageName === 'avaliacoes') carregarAvaliacoes();
}

/* ============================================================
   INICIALIZAÇÃO
   ============================================================ */
document.addEventListener('DOMContentLoaded', () => {
  initTheme();
  initMenu();
  initTabs();
  initSwap();
  initMultitrecho();
  initStars();
  initSearchButton();
  setDatasDefault();
  carregarCompanhias();
});

/* ============================================================
   TEMA (Dark / Light)
   ============================================================ */
function initTheme() {
  const themeBtn = document.getElementById('theme-toggle');
  const themeIcon = themeBtn.querySelector('i');

  const savedTheme = localStorage.getItem('skypass-theme');
  if (savedTheme === 'dark') {
    document.body.classList.add('dark-mode');
    themeIcon.className = 'ph ph-sun';
  }

  themeBtn.addEventListener('click', () => {
    document.body.classList.toggle('dark-mode');
    const isDark = document.body.classList.contains('dark-mode');
    themeIcon.className = isDark ? 'ph ph-sun' : 'ph ph-moon';
    localStorage.setItem('skypass-theme', isDark ? 'dark' : 'light');
  });
}

/* ============================================================
   MENU MOBILE
   ============================================================ */
function initMenu() {
  const menuBtn = document.getElementById('menu-btn');
  const nav = document.getElementById('nav');
  const menuIcon = menuBtn.querySelector('i');

  menuBtn.addEventListener('click', () => {
    nav.classList.toggle('open');
    menuIcon.className = nav.classList.contains('open') ? 'ph ph-x' : 'ph ph-list';
  });

  // Fecha ao clicar em link
  document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', fecharMenuMobile);
  });
}

function fecharMenuMobile() {
  const nav = document.getElementById('nav');
  const menuIcon = document.querySelector('#menu-btn i');
  nav.classList.remove('open');
  if (menuIcon) menuIcon.className = 'ph ph-list';
}

/* ============================================================
   TABS DE TIPO DE VIAGEM
   ============================================================ */
function initTabs() {
  document.querySelectorAll('.tab').forEach(tab => {
    tab.addEventListener('click', () => {
      document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
      tab.classList.add('active');

      const tipo = tab.dataset.tab;
      STATE.tipoViagem = tipo;

      const campoVolta = document.getElementById('campo-volta');
      const formPadrao = document.getElementById('form-padrao');
      const formMulti = document.getElementById('form-multitrecho');

      if (tipo === 'multitrecho') {
        formPadrao.classList.add('hidden');
        formMulti.classList.remove('hidden');
      } else {
        formPadrao.classList.remove('hidden');
        formMulti.classList.add('hidden');
        if (campoVolta) {
          campoVolta.style.display = tipo === 'somente-ida' ? 'none' : '';
        }
      }
    });
  });
}

/* ============================================================
   BOTÃO SWAP (inverter origem/destino)
   ============================================================ */
function initSwap() {
  const swapBtn = document.getElementById('swap-btn');
  if (!swapBtn) return;

  swapBtn.addEventListener('click', () => {
    const origem = document.getElementById('origem');
    const destino = document.getElementById('destino');
    if (!origem || !destino) return;
    [origem.value, destino.value] = [destino.value, origem.value];
  });
}

/* ============================================================
   MULTITRECHO
   ============================================================ */
function initMultitrecho() {
  const addBtn = document.getElementById('add-trecho');
  if (!addBtn) return;

  addBtn.addEventListener('click', () => {
    if (STATE.trechoCount >= 5) {
      alert('Máximo de 5 trechos permitido.');
      return;
    }
    STATE.trechoCount++;
    const container = document.getElementById('trechos-container');
    const div = document.createElement('div');
    div.className = 'trecho-item form-grid-multi';
    div.dataset.trecho = STATE.trechoCount;
    div.innerHTML = `
      <div class="field">
        <label class="field-label"><i class="ph ph-airplane-takeoff"></i> ORIGEM</label>
        <input class="field-input" type="text" placeholder="Cidade de origem" />
      </div>
      <div class="field">
        <label class="field-label"><i class="ph ph-airplane-landing"></i> DESTINO</label>
        <input class="field-input" type="text" placeholder="Cidade de destino" />
      </div>
      <div class="field">
        <label class="field-label"><i class="ph ph-calendar"></i> DATA</label>
        <input class="field-input" type="date" />
      </div>
      <button class="btn btn-outline btn-sm" onclick="removerTrecho(this)" style="align-self:end">
        <i class="ph ph-trash"></i>
      </button>
    `;
    container.appendChild(div);
  });
}

function removerTrecho(btn) {
  const trecho = btn.closest('.trecho-item');
  if (STATE.trechoCount > 1) {
    trecho.remove();
    STATE.trechoCount--;
  }
}

/* ============================================================
   DATAS DEFAULT
   ============================================================ */
function setDatasDefault() {
  const hoje = new Date();
  const amanha = new Date(hoje);
  amanha.setDate(hoje.getDate() + 7);

  const voltaDate = new Date(hoje);
  voltaDate.setDate(hoje.getDate() + 10);

  const fmt = d => d.toISOString().split('T')[0];

  const dataIda = document.getElementById('data-ida');
  const dataVolta = document.getElementById('data-volta');
  if (dataIda) dataIda.value = fmt(amanha);
  if (dataVolta) dataVolta.value = fmt(voltaDate);
}

/* ============================================================
   STARS (Avaliação por critério)
   ============================================================ */
function initStars() {
  // Estrelas do widget rápido (home)
  initStarGroup(document.getElementById('quick-stars'), val => {
    STATE.quickStarValue = val;
  });

  // Estrelas do formulário de avaliação
  ['pontualidade', 'conforto', 'atendimento', 'custo'].forEach(criterio => {
    const container = document.getElementById(`stars-${criterio}`);
    if (container) {
      initStarGroup(container, val => {
        STATE.avaliacoes[criterio] = val;
      });
    }
  });
}

function initStarGroup(container, onSelect) {
  if (!container) return;
  const stars = container.querySelectorAll('i');

  stars.forEach(star => {
    star.addEventListener('mouseenter', () => highlightStars(stars, +star.dataset.val));
    star.addEventListener('mouseleave', () => {
      const selected = container.dataset.selected ? +container.dataset.selected : 0;
      highlightStars(stars, selected);
    });
    star.addEventListener('click', () => {
      const val = +star.dataset.val;
      container.dataset.selected = val;
      highlightStars(stars, val);
      // Preenche estrelas com ícone sólido ao selecionar
      stars.forEach(s => {
        s.className = +s.dataset.val <= val ? 'ph ph-star-fill active' : 'ph ph-star';
      });
      if (onSelect) onSelect(val);
    });
  });
}

function highlightStars(stars, val) {
  stars.forEach(s => {
    s.style.color = +s.dataset.val <= val ? 'var(--star-on)' : '';
  });
}

/* ============================================================
   BOTÃO BUSCAR VOOS
   ============================================================ */
function initSearchButton() {
  const btn = document.getElementById('btn-buscar');
  if (!btn) return;
  btn.addEventListener('click', buscarVoos);
}

async function buscarVoos() {
  const origem = document.getElementById('origem')?.value.trim();
  const destino = document.getElementById('destino')?.value.trim();
  const dataIda = document.getElementById('data-ida')?.value;
  const passageiros = document.getElementById('passageiros')?.value;
  const classe = document.getElementById('classe')?.value;

  if (!origem || !destino) {
    alert('Preencha origem e destino.');
    return;
  }

  const resultadosSection = document.getElementById('resultados-section');
  const listaVoos = document.getElementById('lista-voos');
  const loadingVoos = document.getElementById('loading-voos');
  const subtitulo = document.getElementById('resultado-subtitulo');

  resultadosSection.style.display = 'block';
  listaVoos.innerHTML = '';
  loadingVoos.classList.remove('hidden');

  if (subtitulo) {
    subtitulo.textContent = `${origem} → ${destino} · ${formatarData(dataIda)} · ${passageiros} passageiro(s) · ${classe}`;
  }

  resultadosSection.scrollIntoView({ behavior: 'smooth', block: 'start' });

  try {
    /**
     * API: GET /voos/buscar
     * PARAMS: origem, destino, dataIda, dataVolta, passageiros, classe
     * RESPOSTA: VooDTO[] {
     *   id, companhia, sigla, numeroVoo, aeronave,
     *   origem, horaPartida, destino, horaChegada,
     *   duracao, tipo, preco, classe, amenidades[]
     * }
     */
    let voos;
    if (window.USE_MOCK !== false) {
      // MOCK – remova quando o backend estiver pronto
      await simularDelay(1200);
      voos = MOCK.voos;
    } else {
      const params = new URLSearchParams({ origem, destino, dataIda, passageiros, classe });
      if (STATE.tipoViagem === 'ida-volta') params.set('dataVolta', document.getElementById('data-volta')?.value);
      voos = await API.get(`/voos/buscar?${params}`);
    }

    loadingVoos.classList.add('hidden');

    if (!voos || voos.length === 0) {
      listaVoos.innerHTML = `<div class="error-box"><i class="ph ph-airplane-slash"></i><p>Nenhum voo encontrado para esta rota e data.</p></div>`;
      return;
    }

    voos.forEach(voo => {
      listaVoos.appendChild(criarCardVoo(voo));
    });

  } catch (err) {
    loadingVoos.classList.add('hidden');
    listaVoos.innerHTML = `<div class="error-box"><i class="ph ph-warning-circle"></i><p>Erro ao buscar voos. Verifique a conexão com o servidor.</p></div>`;
    console.error('Erro ao buscar voos:', err);
  }
}

function criarCardVoo(voo) {
  const div = document.createElement('div');
  div.className = 'voo-resultado';
  div.innerHTML = `
    <div class="voo-resultado-header">
      <div class="voo-companhia">
        <div class="cia-badge">${voo.sigla}</div>
        <div>
          <div class="cia-nome">${voo.companhia}</div>
          <div class="cia-voo">${voo.numeroVoo} · ${voo.aeronave}</div>
        </div>
      </div>
      <div class="voo-preco">
        <div class="preco-valor">R$ ${voo.preco.toFixed(2).replace('.', ',')}</div>
        <div class="preco-desc">por pessoa · ${voo.classe || 'Econômica'}</div>
      </div>
    </div>

    <div class="voo-rota">
      <div class="rota-aeroporto">
        <div class="rota-codigo">${voo.origem}</div>
        <div class="rota-hora">${voo.horaPartida}</div>
      </div>
      <div class="rota-centro">
        <div class="rota-linha">
          <span class="rota-duracao">${voo.duracao}</span>
        </div>
        <div class="rota-tipo ${voo.tipo === 'Direto' ? 'tipo-direto' : 'tipo-escala'}">
          ${voo.tipo}
        </div>
      </div>
      <div class="rota-aeroporto">
        <div class="rota-codigo">${voo.destino}</div>
        <div class="rota-hora">${voo.horaChegada}</div>
      </div>
    </div>

    <div class="voo-footer">
      <div class="voo-amenidades">
        ${renderAmenidades(voo.amenidades || [])}
      </div>
      <button class="btn btn-primary btn-sm" onclick="selecionarVoo('${voo.id}', '${voo.companhia}', ${voo.preco})">
        Selecionar
      </button>
    </div>
  `;
  return div;
}

function renderAmenidades(lista) {
  const mapa = {
    wifi: '<span><i class="ph ph-wifi-high"></i> Wi-Fi</span>',
    bagagem23kg: '<span><i class="ph ph-bag-simple"></i> 23kg</span>',
    bagagem10kg: '<span><i class="ph ph-bag-simple"></i> 10kg</span>',
    usb: '<span><i class="ph ph-usb"></i> USB</span>',
    almoco: '<span><i class="ph ph-fork-knife"></i> Refeição</span>'
  };
  if (!lista || lista.length === 0) return '<span><i class="ph ph-info"></i> Sem benefícios</span>';
  return lista.map(a => mapa[a] || `<span>${a}</span>`).join('');
}

function selecionarVoo(id, companhia, preco) {
  /**
   * INTEGRAÇÃO: após selecionar o voo, redirecionar para fluxo de compra
   * API: POST /reservas
   * PAYLOAD: { vooId, passageiros, classe, tipoViagem }
   * RESPOSTA: ReservaDTO { codigo, status, ... }
   */
  alert(`Voo ${id} selecionado!\n${companhia} – R$ ${preco.toFixed(2)}\n\nIntegração com o fluxo de pagamento/checkout aqui.`);
}

/* ============================================================
   WIDGET – BUSCA RÁPIDA DE RESERVA (página Voos)
   ============================================================ */
function buscarReservaRapida() {
  const codigo = document.getElementById('codigo-reserva-rapido')?.value.trim().toUpperCase();
  const msg = document.getElementById('msg-reserva-rapida');
  if (!codigo) { mostrarMsg(msg, 'Informe o código da reserva.', 'error'); return; }

  // Navega para a página de reserva com o código preenchido
  showPage('reserva');
  setTimeout(() => {
    const input = document.getElementById('res-codigo');
    if (input) { input.value = codigo; input.focus(); }
  }, 300);
}

/* ============================================================
   CHECK-IN
   ============================================================ */
async function realizarCheckin() {
  const codigo = document.getElementById('ci-codigo')?.value.trim().toUpperCase();
  const sobrenome = document.getElementById('ci-sobrenome')?.value.trim().toUpperCase();

  if (!codigo || !sobrenome) {
    alert('Preencha o código da reserva e o sobrenome.');
    return;
  }

  const resultado = document.getElementById('checkin-resultado');
  const sucesso = document.getElementById('checkin-sucesso');
  resultado.classList.add('hidden');
  sucesso.classList.add('hidden');

  try {
    /**
     * API: GET /checkin/buscar?codigo={codigo}&sobrenome={sobrenome}
     * RESPOSTA: {
     *   passageiros: [{ nome, cpf, assento, tipo }],
     *   vooId: string,
     *   assentos: [{ numero, disponivel }]
     * }
     */
    await simularDelay(800);

    // MOCK
    const data = {
      passageiros: [
        { nome: `${sobrenome} PASSAGEIRO`, cpf: '***.***.***-01', assento: null, tipo: 'Adulto' }
      ],
      vooId: 'VOO001',
      assentos: gerarAssentosMock()
    };

    STATE.checkinPassageiros = data.passageiros;

    // Renderiza passageiros
    const lista = document.getElementById('checkin-passageiros');
    lista.innerHTML = data.passageiros.map((p, i) => `
      <div class="passageiro-item">
        <div class="passageiro-avatar"><i class="ph ph-user"></i></div>
        <div>
          <div class="passageiro-nome">${p.nome}</div>
          <div class="passageiro-doc">CPF: ${p.cpf}</div>
        </div>
        <input type="checkbox" class="checkin-checkbox" id="ci-pass-${i}" checked />
      </div>
    `).join('');

    // Renderiza mapa de assentos
    renderMapaAssentos(data.assentos);

    resultado.classList.remove('hidden');

  } catch (err) {
    alert('Reserva não encontrada. Verifique os dados informados.');
    console.error('Erro check-in:', err);
  }
}

function gerarAssentosMock() {
  const assentos = [];
  const ocupados = ['1A','1B','2C','3A','5B','7C','8A','10B'];
  for (let fileira = 1; fileira <= 20; fileira++) {
    ['A','B','C','','D','E','F'].forEach(letra => {
      if (!letra) { assentos.push({ numero: null, disponivel: false, corredor: true }); return; }
      const num = `${fileira}${letra}`;
      assentos.push({ numero: num, disponivel: !ocupados.includes(num), corredor: false });
    });
  }
  return assentos;
}

function renderMapaAssentos(assentos) {
  /**
   * INTEGRAÇÃO: GET /voos/{vooId}/assentos
   * RESPOSTA: [{ numero, disponivel }]
   */
  const grid = document.getElementById('mapa-assentos');
  if (!grid) return;
  grid.innerHTML = assentos.map(a => {
    if (a.corredor) return `<div class="assento corredor"></div>`;
    const cls = a.disponivel ? 'assento' : 'assento ocupado';
    return `<div class="${cls}" data-num="${a.numero}" onclick="selecionarAssento(this)">${a.numero}</div>`;
  }).join('');
}

function selecionarAssento(el) {
  if (el.classList.contains('ocupado')) return;
  document.querySelectorAll('.assento.selecionado').forEach(a => a.classList.remove('selecionado'));
  el.classList.add('selecionado');
  STATE.assentoSelecionado = el.dataset.num;
}

async function confirmarCheckin() {
  if (!STATE.assentoSelecionado) {
    alert('Selecione um assento antes de confirmar o check-in.');
    return;
  }

  try {
    /**
     * API: POST /checkin/confirmar
     * PAYLOAD: { codigoReserva, passageiros: [{ nome, assento }] }
     * RESPOSTA: { cartaoEmbarque: base64String, mensagem: string }
     */
    await simularDelay(800);

    document.getElementById('checkin-resultado').classList.add('hidden');
    document.getElementById('checkin-sucesso').classList.remove('hidden');

  } catch (err) {
    alert('Erro ao confirmar check-in. Tente novamente.');
    console.error('Erro confirmação check-in:', err);
  }
}

function downloadBoardingPass() {
  /**
   * INTEGRAÇÃO: GET /checkin/cartao-embarque/{codigoReserva}
   * RESPOSTA: arquivo PDF (blob)
   */
  alert('Integração com download do cartão de embarque aqui.\nEndpoint: GET /api/checkin/cartao-embarque/{codigo}');
}

/* ============================================================
   MINHA RESERVA
   ============================================================ */
async function buscarReserva() {
  const codigo = document.getElementById('res-codigo')?.value.trim().toUpperCase();
  const email = document.getElementById('res-email')?.value.trim();

  if (!codigo || !email) {
    alert('Preencha o código da reserva e o e-mail.');
    return;
  }

  const detalhes = document.getElementById('reserva-detalhes');
  const naoEncontrada = document.getElementById('reserva-nao-encontrada');
  detalhes.classList.add('hidden');
  naoEncontrada.classList.add('hidden');

  try {
    /**
     * API: GET /reservas/{codigo}?email={email}
     * RESPOSTA: ReservaDTO {
     *   codigo, status,
     *   vooIda: VooDTO,
     *   vooVolta?: VooDTO,
     *   passageiros: [{ nome, cpf, assento, tipo }],
     *   valores: [{ descricao, valor }]
     * }
     */
    await simularDelay(700);

    // MOCK
    const reserva = { ...MOCK.reserva, codigo };

    // Exibe código
    document.getElementById('res-codigo-display').textContent = reserva.codigo;
    const statusEl = document.getElementById('res-status');
    statusEl.textContent = reserva.status;
    statusEl.className = `status-badge ${reserva.status.toLowerCase()}`;

    // Voo de ida
    document.getElementById('res-voo-ida').innerHTML = renderVooCard(reserva.vooIda, 'Voo de ida');

    // Voo de volta
    if (reserva.vooVolta) {
      document.getElementById('res-voo-volta').innerHTML = renderVooCard(reserva.vooVolta, 'Voo de volta');
      document.getElementById('res-voo-volta-wrapper').classList.remove('hidden');
    }

    // Passageiros
    const passLista = document.getElementById('res-passageiros-lista');
    passLista.innerHTML = reserva.passageiros.map(p => `
      <div class="passageiro-item">
        <div class="passageiro-avatar"><i class="ph ph-user"></i></div>
        <div>
          <div class="passageiro-nome">${p.nome}</div>
          <div class="passageiro-doc">CPF: ${p.cpf} · Assento: ${p.assento || '–'} · ${p.tipo}</div>
        </div>
      </div>
    `).join('');

    // Valores
    const valoresTable = document.getElementById('res-valores-table');
    valoresTable.innerHTML = reserva.valores.map(v => `
      <div class="valor-linha">
        <span>${v.descricao}</span>
        <span>R$ ${v.valor.toFixed(2).replace('.', ',')}</span>
      </div>
    `).join('');

    detalhes.classList.remove('hidden');

  } catch (err) {
    naoEncontrada.classList.remove('hidden');
    console.error('Erro ao buscar reserva:', err);
  }
}

function renderVooCard(voo, titulo) {
  return `
    <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:14px;">
      <strong style="font-size:0.8rem; text-transform:uppercase; color:var(--text-muted)">${titulo}</strong>
      <span class="status-badge" style="font-size:0.7rem">${voo.tipo || 'Direto'}</span>
    </div>
    <div style="display:flex; align-items:center; gap:24px;">
      <div>
        <div style="font-size:1.6rem; font-weight:800">${voo.origem}</div>
        <div style="color:var(--text-muted); font-size:0.85rem">${voo.horaPartida}</div>
      </div>
      <div style="flex:1; text-align:center; color:var(--text-muted); font-size:0.82rem">
        <div style="border-top:1.5px dashed var(--border); width:100%;"></div>
        <div style="margin-top:4px">${voo.companhia} · ${voo.numeroVoo}</div>
      </div>
      <div style="text-align:right">
        <div style="font-size:1.6rem; font-weight:800">${voo.destino}</div>
        <div style="color:var(--text-muted); font-size:0.85rem">${voo.horaChegada}</div>
      </div>
    </div>
    ${voo.data ? `<div style="margin-top:10px; font-size:0.8rem; color:var(--text-muted)"><i class="ph ph-calendar"></i> ${voo.data}</div>` : ''}
  `;
}

async function cancelarReserva() {
  const codigo = document.getElementById('res-codigo-display')?.textContent;
  if (!confirm(`Tem certeza que deseja cancelar a reserva ${codigo}?`)) return;

  try {
    /**
     * API: DELETE /reservas/{codigo}
     * RESPOSTA: { mensagem: "Reserva cancelada com sucesso" }
     */
    await simularDelay(600);
    alert(`Reserva ${codigo} cancelada. Reembolso processado conforme política.`);
    // Atualiza status na UI
    const statusEl = document.getElementById('res-status');
    statusEl.textContent = 'CANCELADA';
    statusEl.className = 'status-badge cancelada';
  } catch (err) {
    alert('Erro ao cancelar reserva.');
    console.error(err);
  }
}

async function alterarReserva() {
  /**
   * INTEGRAÇÃO: Redirecionar para fluxo de alteração
   * API: GET /reservas/{codigo}/opcoes-alteracao
   */
  alert('Funcionalidade de alteração de reserva.\nEndpoint: GET /api/reservas/{codigo}/opcoes-alteracao');
}

/* ============================================================
   AVALIAÇÕES
   ============================================================ */
async function carregarAvaliacoes() {
  carregarRanking();
  carregarAvaliacoesRecentes();
}

async function carregarRanking() {
  const container = document.getElementById('ranking-companhias');
  if (!container) return;

  container.innerHTML = `<div class="loading-box"><i class="ph ph-circle-notch ph-spin"></i><p>Carregando...</p></div>`;

  try {
    /**
     * API: GET /avaliacoes/ranking-companhias
     *
     * Pipeline MongoDB (Spring Data / Aggregation):
     * [
     *   { $group: {
     *     _id: "$companhia",
     *     mediaGeral: { $avg: { $avg: ["$pontualidade","$conforto","$atendimento","$custo"] } },
     *     totalAvaliacoes: { $sum: 1 }
     *   }},
     *   { $sort: { mediaGeral: -1 } },
     *   { $limit: 5 }
     * ]
     *
     * RESPOSTA: [{ companhia, sigla, mediaGeral, totalAvaliacoes }]
     */
    await simularDelay(900);
    const ranking = MOCK.ranking;

    const posClasses = ['gold', 'silver', 'bronze'];
    container.innerHTML = ranking.map((item, i) => `
      <div class="ranking-item">
        <div class="ranking-pos ${posClasses[i] || ''}">${i + 1}º</div>
        <div class="ranking-info">
          <div class="ranking-nome">${item.companhia}</div>
          <div class="ranking-total">${item.totalAvaliacoes} avaliações</div>
          <div class="ranking-bar">
            <div class="ranking-bar-fill" style="width:${(item.mediaGeral / 5) * 100}%"></div>
          </div>
        </div>
        <div class="ranking-nota">
          <div class="nota-num">${item.mediaGeral.toFixed(1)}</div>
          <div class="nota-estrelas">${renderStarsStatic(Math.round(item.mediaGeral))}</div>
        </div>
      </div>
    `).join('');

  } catch (err) {
    container.innerHTML = `<p style="color:var(--text-muted); font-size:0.88rem;">Erro ao carregar ranking.</p>`;
    console.error('Erro ranking:', err);
  }
}

async function carregarAvaliacoesRecentes() {
  const container = document.getElementById('avaliacoes-recentes');
  if (!container) return;

  container.innerHTML = `<div class="loading-box"><i class="ph ph-circle-notch ph-spin"></i><p>Carregando...</p></div>`;

  try {
    /**
     * API: GET /avaliacoes/recentes?limit=5
     * RESPOSTA: AvaliacaoDTO[] {
     *   id, autor, companhia, vooId,
     *   pontualidade, conforto, atendimento, custo,
     *   mediaGeral, comentario, dataAvaliacao
     * }
     *
     * Documento MongoDB (Collection: avaliacoes):
     * {
     *   _id: ObjectId,
     *   vooId: "VOO001",           <- chave de relacionamento com o voo no Java
     *   companhia: "Azul",
     *   autor: "João Silva",
     *   pontualidade: 5,
     *   conforto: 4,
     *   atendimento: 5,
     *   custo: 4,
     *   comentario: "Ótimo voo!",
     *   dataAvaliacao: ISODate("2026-05-22")
     * }
     */
    await simularDelay(600);
    const avaliacoes = MOCK.avaliacoesRecentes;

    container.innerHTML = avaliacoes.map(av => `
      <div class="av-item">
        <div class="av-header">
          <div>
            <div class="av-autor">${av.autor}</div>
            <div class="av-companhia">${av.companhia} · Voo ${av.vooId}</div>
          </div>
          <div class="av-stars">${renderStarsStatic(av.mediaGeral)}</div>
        </div>
        ${av.comentario ? `<div class="av-texto">${av.comentario}</div>` : ''}
        <div class="av-data"><i class="ph ph-calendar"></i> ${av.data}</div>
      </div>
    `).join('');

  } catch (err) {
    container.innerHTML = `<p style="color:var(--text-muted); font-size:0.88rem;">Erro ao carregar avaliações.</p>`;
    console.error('Erro avaliações recentes:', err);
  }
}

async function enviarAvaliacao() {
  const vooId = document.getElementById('av-voo-id')?.value.trim();
  const companhia = document.getElementById('av-companhia')?.value;
  const nome = document.getElementById('av-nome')?.value.trim() || 'Anônimo';
  const comentario = document.getElementById('av-comentario')?.value.trim();

  // Validações
  if (!vooId) { alert('Informe o código do voo.'); return; }
  if (!companhia) { alert('Selecione a companhia aérea.'); return; }

  const { pontualidade, conforto, atendimento, custo } = STATE.avaliacoes;
  if (!pontualidade || !conforto || !atendimento || !custo) {
    alert('Avalie todos os critérios antes de enviar.');
    return;
  }

  const mediaGeral = ((pontualidade + conforto + atendimento + custo) / 4);

  const payload = {
    vooId,           // chave de relacionamento com o backend Java
    companhia,
    autor: nome,
    pontualidade,
    conforto,
    atendimento,
    custo,
    mediaGeral,
    comentario
  };

  const btn = document.getElementById('btn-enviar-avaliacao');
  btn.disabled = true;
  btn.innerHTML = '<i class="ph ph-circle-notch ph-spin"></i> Enviando...';

  try {
    /**
     * API: POST /avaliacoes
     * PAYLOAD: AvaliacaoDTO (acima)
     *
     * Backend Java (Spring) salva no MongoDB:
     * avaliacaoRepository.save(new Avaliacao(dto));
     *
     * RESPOSTA: { id: ObjectId, mensagem: "Avaliação registrada com sucesso" }
     */
    await simularDelay(900);

    document.getElementById('av-sucesso').classList.remove('hidden');
    btn.classList.add('hidden');

    // Recarrega ranking e recentes
    carregarRanking();
    carregarAvaliacoesRecentes();

    // Reseta o formulário
    setTimeout(() => resetFormAvaliacao(), 3000);

  } catch (err) {
    alert('Erro ao enviar avaliação. Tente novamente.');
    console.error('Erro ao enviar avaliação:', err);
    btn.disabled = false;
    btn.innerHTML = '<i class="ph ph-paper-plane-tilt"></i> Enviar avaliação';
  }
}

function resetFormAvaliacao() {
  document.getElementById('av-voo-id').value = '';
  document.getElementById('av-companhia').value = '';
  document.getElementById('av-nome').value = '';
  document.getElementById('av-comentario').value = '';
  document.getElementById('av-sucesso').classList.add('hidden');

  const btn = document.getElementById('btn-enviar-avaliacao');
  btn.classList.remove('hidden');
  btn.disabled = false;
  btn.innerHTML = '<i class="ph ph-paper-plane-tilt"></i> Enviar avaliação';

  // Reseta estrelas
  STATE.avaliacoes = { pontualidade: 0, conforto: 0, atendimento: 0, custo: 0 };
  document.querySelectorAll('.stars-input').forEach(container => {
    container.dataset.selected = 0;
    container.querySelectorAll('i').forEach(s => {
      s.className = 'ph ph-star';
      s.style.color = '';
    });
  });
}

/* ============================================================
   POPULAR SELECT DE COMPANHIAS VIA API
   ============================================================ */
async function carregarCompanhias() {
  /**
   * INTEGRAÇÃO: GET /companhias
   * RESPOSTA: [{ id, nome, sigla }]
   * Popula o select no formulário de avaliação.
   * Por enquanto, está estático no HTML.
   */
}

/* ============================================================
   UTILITÁRIOS
   ============================================================ */
function renderStarsStatic(nota) {
  return Array.from({ length: 5 }, (_, i) =>
    `<i class="ph ${i < nota ? 'ph-star-fill' : 'ph-star'}"></i>`
  ).join('');
}

function formatarData(isoDate) {
  if (!isoDate) return '—';
  const [y, m, d] = isoDate.split('-');
  return `${d}/${m}/${y}`;
}

function mostrarMsg(el, texto, tipo) {
  if (!el) return;
  el.textContent = texto;
  el.className = `msg-feedback ${tipo}`;
  el.classList.remove('hidden');
  setTimeout(() => el.classList.add('hidden'), 4000);
}

function simularDelay(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}