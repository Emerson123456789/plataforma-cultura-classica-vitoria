<template>
  <section class="map-view">
    <h2>Mapa cultural</h2>
    <p>
      Visualize a localização das instituições culturais cadastradas na plataforma.
    </p>

    <CulturalMap />
  </section>
</template>

<script setup>
import CulturalMap from '../components/CulturalMap.vue'
</script>

<style scoped>
.map-view {
  display: grid;
  gap: 1rem;
}
</style>