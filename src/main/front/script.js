const themeBtn = document.getElementById('themeToggle');
const themeIcon = themeBtn.querySelector('i');

// Aplica tema salvo ao carregar
const currentTheme = localStorage.getItem('theme');
if (currentTheme === 'dark') {
  document.body.classList.add('dark-mode');
  themeIcon.className = 'ph ph-sun';
}

// Alterna tema ao clicar
themeBtn.addEventListener('click', () => {
  document.body.classList.toggle('dark-mode');
  const isDark = document.body.classList.contains('dark-mode');

  if (isDark) {
    themeIcon.className = 'ph ph-sun';
    localStorage.setItem('theme', 'dark');
  } else {
    themeIcon.className = 'ph ph-moon';
    localStorage.setItem('theme', 'light');
  }
});
