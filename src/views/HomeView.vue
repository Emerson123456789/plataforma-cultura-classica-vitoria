<template>
  <section class="home">
    <div class="hero">
      <p class="eyebrow">Plataforma digital</p>
      <h2>Promoção da cultura clássica na Grande Vitória</h2>
      <p class="hero-text">
        Consulte instituições culturais, acompanhe eventos e explore o mapa cultural
        em uma interface simples e acessível.
      </p>

      <div class="hero-actions">
        <RouterLink class="primary-link" to="/institutions">
          Ver instituições
        </RouterLink>
        <RouterLink class="secondary-link" to="/events">
          Ver eventos
        </RouterLink>
      </div>
    </div>

    <div class="home-grid">
      <article class="info-card">
        <h3>Instituições</h3>
        <p>
          Consulte espaços culturais vinculados à música, teatro, literatura,
          artes visuais, dança e formação.
        </p>
      </article>

      <article class="info-card">
        <h3>Eventos</h3>
        <p>
          Acompanhe apresentações, oficinas, encontros formativos e atividades
          culturais cadastradas na plataforma.
        </p>
      </article>

      <article class="info-card">
        <h3>Mapa cultural</h3>
        <p>
          Visualize no mapa a localização das instituições culturais presentes
          na aplicação.
        </p>
      </article>
    </div>
  </section>
</template>

<script setup>
import { RouterLink } from 'vue-router'
</script>

<style scoped>
.home {
  display: grid;
  gap: 2rem;
}

.hero {
  background: linear-gradient(135deg, #f8fafc, #eef2ff);
  border: 1px solid #e5e7eb;
  border-radius: 16px;
  padding: 2rem;
}

.eyebrow {
  margin: 0 0 0.5rem;
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: #6b7280;
}

.hero h2 {
  margin: 0;
  font-size: 2rem;
}

.hero-text {
  max-width: 720px;
  margin-top: 1rem;
  color: #4b5563;
  line-height: 1.6;
}

.hero-actions {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
  margin-top: 1.5rem;
}

.primary-link,
.secondary-link {
  display: inline-block;
  padding: 0.75rem 1rem;
  border-radius: 10px;
}

.primary-link {
  background: #1f2937;
  color: white;
}

.secondary-link {
  background: white;
  color: #1f2937;
  border: 1px solid #d1d5db;
}

.home-grid {
  display: grid;
  gap: 1rem;
}

.info-card {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 14px;
  padding: 1.25rem;
}

.info-card h3 {
  margin-top: 0;
}

.info-card p {
  margin-bottom: 0;
  color: #4b5563;
  line-height: 1.5;
}

@media (min-width: 900px) {
  .home-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
</style>