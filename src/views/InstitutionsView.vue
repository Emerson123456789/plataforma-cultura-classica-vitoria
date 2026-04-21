<template>
  <section>
    <div class="page-header">
      <h2>Instituições</h2>
      <p>Instituições culturais cadastradas na plataforma.</p>
    </div>

    <div class="filters">
      <input
        id="institution-search"
        v-model="searchTerm"
        type="text"
        placeholder="Buscar instituição por nome"
      />

      <select id="institution-category" v-model="selectedCategory">
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
      {{ filteredInstitutions.length }}
      {{ filteredInstitutions.length === 1 ? 'instituição encontrada' : 'instituições encontradas' }}
    </p>

    <div class="grid">
      <InstitutionCard
        v-for="institution in filteredInstitutions"
        :key="institution.id"
        :institution="institution"
      />
    </div>

    <p v-if="filteredInstitutions.length === 0" class="empty-message">
      Nenhuma instituição encontrada para os critérios informados.
    </p>
  </section>
</template>

<script setup>
import { computed, ref } from 'vue'
import baseInstitutions from '../data/institutions.json'
import InstitutionCard from '../components/InstitutionCard.vue'

const selectedCategory = ref('Todas')
const searchTerm = ref('')
const localInstitutions = ref(
  JSON.parse(localStorage.getItem('localInstitutions') || '[]')
)

const allInstitutions = computed(() => [
  ...baseInstitutions,
  ...localInstitutions.value
])

const categories = computed(() => {
  return [...new Set(allInstitutions.value.map(item => item.category))].sort()
})

const filteredInstitutions = computed(() => {
  return allInstitutions.value.filter(institution => {
    const matchesCategory =
      selectedCategory.value === 'Todas' ||
      institution.category === selectedCategory.value

    const matchesSearch =
      institution.name.toLowerCase().includes(searchTerm.value.toLowerCase())

    return matchesCategory && matchesSearch
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