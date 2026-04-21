<template>
  <section v-if="institution">
    <h2>{{ institution.name }}</h2>
    <p><strong>Categoria:</strong> {{ institution.category }}</p>
    <p><strong>Cidade:</strong> {{ institution.city }}</p>
    <p><strong>Endereço:</strong> {{ institution.address }}</p>
    <p><strong>Descrição:</strong> {{ institution.description }}</p>

    <h3 class="section-title">Eventos relacionados</h3>

    <div v-if="relatedEvents.length > 0" class="grid">
      <EventCard
        v-for="event in relatedEvents"
        :key="event.id"
        :event="event"
      />
    </div>

    <p v-else>Não há eventos relacionados a esta instituição.</p>

    <RouterLink class="back-link" to="/institutions">
      Voltar para instituições
    </RouterLink>
  </section>

  <section v-else>
    <h2>Instituição não encontrada</h2>
    <p>Não foi possível localizar a instituição solicitada.</p>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import { useRoute, RouterLink } from 'vue-router'
import baseInstitutions from '../data/institutions.json'
import baseEvents from '../data/events.json'
import EventCard from '../components/EventCard.vue'

const route = useRoute()
const institutionId = Number(route.params.id)

const localInstitutions = JSON.parse(
  localStorage.getItem('localInstitutions') || '[]'
)

const localEvents = JSON.parse(
  localStorage.getItem('localEvents') || '[]'
)

const allInstitutions = [
  ...baseInstitutions,
  ...localInstitutions
]

const allEvents = [
  ...baseEvents,
  ...localEvents
]

const institution = computed(() =>
  allInstitutions.find(item => item.id === institutionId)
)

const relatedEvents = computed(() =>
  allEvents.filter(event => event.institutionId === institutionId)
)
</script>

<style scoped>
.section-title {
  margin-top: 2rem;
}

.grid {
  display: grid;
  gap: 1rem;
  margin-top: 1rem;
}

.back-link {
  display: inline-block;
  margin-top: 1.5rem;
  padding: 0.5rem 0.75rem;
  background: #1f2937;
  color: white;
  border-radius: 8px;
}
</style>