<template>
  <section>
    <div class="page-header">
      <h2>Eventos</h2>
      <p>Eventos culturais cadastrados na plataforma.</p>
    </div>

    <div class="filters">
      <input
        id="event-search"
        v-model="searchTerm"
        type="text"
        placeholder="Buscar evento por título"
      />

      <select id="event-category" v-model="selectedCategory">
        <option value="Todas">Todas as categorias</option>
        <option
          v-for="category in categories"
          :key="category"
          :value="category"
        >
          {{ category }}
        </option>
      </select>

      <button
        v-if="hasActiveFilters"
        type="button"
        class="clear-button"
        @click="clearFilters"
      >
        Limpar
      </button>
    </div>

    <p class="results-count">
      {{ filteredEvents.length }}
      {{ filteredEvents.length === 1 ? 'evento encontrado' : 'eventos encontrados' }}
    </p>

    <div class="grid">
      <EventCard
        v-for="event in filteredEvents"
        :key="event.id"
        :event="event"
      />
    </div>

    <p v-if="filteredEvents.length === 0" class="empty-message">
      Nenhum evento encontrado para os critérios informados.
    </p>
  </section>
</template>

<script setup>
import { computed, ref } from 'vue'
import baseEvents from '../data/events.json'
import EventCard from '../components/EventCard.vue'

const selectedCategory = ref('Todas')
const searchTerm = ref('')
const localEvents = ref(
  JSON.parse(localStorage.getItem('localEvents') || '[]')
)

const allEvents = computed(() => [
  ...baseEvents,
  ...localEvents.value
])

const categories = computed(() => {
  return [...new Set(allEvents.value.map(item => item.category))].sort()
})

const filteredEvents = computed(() => {
  const filtered = allEvents.value.filter(event => {
    const matchesCategory =
      selectedCategory.value === 'Todas' ||
      event.category === selectedCategory.value

    const matchesSearch =
      event.title.toLowerCase().includes(searchTerm.value.toLowerCase())

    return matchesCategory && matchesSearch
  })

  return [...filtered].sort((a, b) => {
    const dateA = `${a.date}T${a.time}`
    const dateB = `${b.date}T${b.time}`
    return dateA.localeCompare(dateB)
  })
})

const hasActiveFilters = computed(() => {
  return selectedCategory.value !== 'Todas' || searchTerm.value.trim() !== ''
})

function clearFilters() {
  selectedCategory.value = 'Todas'
  searchTerm.value = ''
}
</script>

<style scoped>
.page-header {
  margin-bottom: 1rem;
}

.page-header p {
  color: #6b7280;
}

.filters {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
  align-items: center;
  margin: 1rem 0 1.25rem;
}

input,
select {
  padding: 0.65rem 0.8rem;
  border-radius: 10px;
  border: 1px solid #d1d5db;
  font: inherit;
  background: white;
}

input {
  min-width: 260px;
  flex: 1 1 260px;
}

select {
  min-width: 220px;
}

.clear-button {
  padding: 0.65rem 0.9rem;
  border: 1px solid #d1d5db;
  border-radius: 10px;
  background: white;
  color: #374151;
}

.results-count {
  margin: 0 0 1rem;
  color: #4b5563;
  font-weight: 500;
}

.grid {
  display: grid;
  gap: 1rem;
}

.empty-message {
  margin-top: 1rem;
  color: #666;
}
</style>