<template>
  <div ref="mapContainer" class="map"></div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import L from 'leaflet'
import baseInstitutions from '../data/institutions.json'

const mapContainer = ref(null)

onMounted(() => {
  const localInstitutions = JSON.parse(
    localStorage.getItem('localInstitutions') || '[]'
  )

  const allInstitutions = [
    ...baseInstitutions,
    ...localInstitutions
  ]

  const map = L.map(mapContainer.value)

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; OpenStreetMap contributors'
  }).addTo(map)

  const markers = []

  allInstitutions.forEach(institution => {
    if (
      typeof institution.latitude === 'number' &&
      typeof institution.longitude === 'number'
    ) {
      const marker = L.marker([institution.latitude, institution.longitude])
        .addTo(map)
        .bindPopup(`
          <strong>${institution.name}</strong><br>
          ${institution.category}<br>
          ${institution.address}<br><br>
          <a href="/institutions/${institution.id}">Ver detalhes</a>
        `)

      markers.push(marker)
    }
  })

  if (markers.length > 0) {
    const group = L.featureGroup(markers)
    map.fitBounds(group.getBounds(), { padding: [30, 30] })
  } else {
    map.setView([-20.315, -40.312], 13)
  }
})
</script>

<style scoped>
.map {
  width: 100%;
  height: 500px;
  border-radius: 12px;
  overflow: hidden;
}
</style>