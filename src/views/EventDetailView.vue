<template>
  <section v-if="event">
    <h2>{{ event.title }}</h2>
    <p><strong>Categoria:</strong> {{ event.category }}</p>
    <p><strong>Data:</strong> {{ formattedDate }} às {{ event.time }}</p>
    <p><strong>Local:</strong> {{ event.location }}</p>
    <p><strong>Descrição:</strong> {{ event.description }}</p>

    <div v-if="institution" class="institution-box">
      <h3>Instituição responsável</h3>
      <p><strong>Nome:</strong> {{ institution.name }}</p>
      <p><strong>Cidade:</strong> {{ institution.city }}</p>

      <RouterLink
        class="details-link"
        :to="`/institutions/${institution.id}`"
      >
        Ver instituição
      </RouterLink>
    </div>

    <RouterLink class="back-link" to="/events">
      Voltar para eventos
    </RouterLink>
  </section>

  <section v-else>
    <h2>Evento não encontrado</h2>
    <p>Não foi possível localizar o evento solicitado.</p>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import { useRoute, RouterLink } from 'vue-router'
import baseEvents from '../data/events.json'
import baseInstitutions from '../data/institutions.json'

const route = useRoute()
const eventId = Number(route.params.id)

const localEvents = JSON.parse(
  localStorage.getItem('localEvents') || '[]'
)

const localInstitutions = JSON.parse(
  localStorage.getItem('localInstitutions') || '[]'
)

const allEvents = [
  ...baseEvents,
  ...localEvents
]

const allInstitutions = [
  ...baseInstitutions,
  ...localInstitutions
]

const event = computed(() =>
  allEvents.find(item => item.id === eventId)
)

const institution = computed(() => {
  if (!event.value) return null
  return allInstitutions.find(item => item.id === event.value.institutionId)
})

const formattedDate = computed(() => {
  if (!event.value) return ''
  const [year, month, day] = event.value.date.split('-')
  return `${day}/${month}/${year}`
})
</script>

<style scoped>
.institution-box {
  margin-top: 2rem;
  padding: 1rem;
  background: white;
  border: 1px solid #ddd;
  border-radius: 12px;
}

.details-link,
.back-link {
  display: inline-block;
  margin-top: 1rem;
  padding: 0.5rem 0.75rem;
  background: #1f2937;
  color: white;
  border-radius: 8px;
}

.back-link {
  margin-left: 0;
}
</style>