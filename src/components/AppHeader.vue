<template>
  <header class="header">
    <div class="brand">
      <h1>Cultura Clássica GV</h1>
    </div>

    <nav class="nav">
      <RouterLink to="/">Início</RouterLink>
      <RouterLink to="/institutions">Instituições</RouterLink>
      <RouterLink to="/events">Eventos</RouterLink>
      <RouterLink to="/map">Mapa</RouterLink>
      <RouterLink to="/admin">Curadoria</RouterLink>
    </nav>
  </header>
</template>

<script setup>
import { RouterLink } from 'vue-router'
</script>

<style scoped>
.header {
  background: #1f2937;
  color: white;
  padding: 1rem 2rem;
}

.brand h1 {
  margin: 0 0 1rem 0;
  font-size: 1.5rem;
}

.nav {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
}

.nav a {
  color: white;
  font-weight: 500;
}

.nav a.router-link-exact-active {
  text-decoration: underline;
}
</style>