<template>
  <section class="admin-view">
    <div class="page-header">
      <h2>Curadoria administrativa</h2>
      <p>
        Área de cadastro local para instituições e eventos culturais.
      </p>
    </div>

    <div class="admin-grid">
      <section class="form-section">
        <h3>Cadastrar instituição</h3>

        <form @submit.prevent="addInstitution" class="form">
          <input v-model="institutionForm.name" type="text" placeholder="Nome da instituição" required />

          <select v-model="institutionForm.category" required>
            <option disabled value="">Selecione a categoria</option>
            <option v-for="category in institutionCategories" :key="category" :value="category">
              {{ category }}
            </option>
          </select>

          <input v-model="institutionForm.address" type="text" placeholder="Endereço" required />
          <input v-model="institutionForm.city" type="text" placeholder="Cidade" required />
          <textarea v-model="institutionForm.description" placeholder="Descrição" required></textarea>

          <input
            v-model.number="institutionForm.latitude"
            type="number"
            step="any"
            placeholder="Latitude"
            required
          />

          <input
            v-model.number="institutionForm.longitude"
            type="number"
            step="any"
            placeholder="Longitude"
            required
          />

          <button type="submit">Salvar instituição</button>
        </form>
      </section>

      <section class="form-section">
        <h3>Cadastrar evento</h3>

        <form @submit.prevent="addEvent" class="form">
          <input v-model="eventForm.title" type="text" placeholder="Título do evento" required />

          <select v-model="eventForm.category" required>
            <option disabled value="">Selecione a categoria</option>
            <option v-for="category in eventCategories" :key="category" :value="category">
              {{ category }}
            </option>
          </select>

          <input v-model="eventForm.date" type="date" required />
          <input v-model="eventForm.time" type="time" required />

          <select v-model.number="eventForm.institutionId" required>
            <option disabled value="">Selecione a instituição</option>
            <option
              v-for="institution in allInstitutions"
              :key="institution.id"
              :value="institution.id"
            >
              {{ institution.name }}
            </option>
          </select>

          <input v-model="eventForm.location" type="text" placeholder="Local" required />
          <textarea v-model="eventForm.description" placeholder="Descrição" required></textarea>

          <button type="submit">Salvar evento</button>
        </form>
      </section>
    </div>

    <div class="admin-grid">
      <section class="list-section">
        <div class="list-header">
          <h3>Instituições cadastradas localmente</h3>
          <button type="button" class="danger-button" @click="clearInstitutions">
            Limpar instituições locais
          </button>
        </div>

        <ul v-if="localInstitutions.length > 0" class="item-list">
          <li v-for="institution in localInstitutions" :key="institution.id">
            <strong>{{ institution.name }}</strong> — {{ institution.category }}
          </li>
        </ul>

        <p v-else>Nenhuma instituição cadastrada localmente.</p>
      </section>

      <section class="list-section">
        <div class="list-header">
          <h3>Eventos cadastrados localmente</h3>
          <button type="button" class="danger-button" @click="clearEvents">
            Limpar eventos locais
          </button>
        </div>

        <ul v-if="localEvents.length > 0" class="item-list">
          <li v-for="event in localEvents" :key="event.id">
            <strong>{{ event.title }}</strong> — {{ event.category }}
          </li>
        </ul>

        <p v-else>Nenhum evento cadastrado localmente.</p>
      </section>
    </div>
  </section>
</template>

<script setup>
import { computed, reactive, ref, watch } from 'vue'
import baseInstitutions from '../data/institutions.json'

const institutionCategories = [
  'Música',
  'Teatro',
  'Literatura',
  'Artes Visuais',
  'Dança',
  'Formação'
]

const eventCategories = [
  'Música',
  'Teatro',
  'Literatura',
  'Artes Visuais',
  'Dança',
  'Formação'
]

const localInstitutions = ref(
  JSON.parse(localStorage.getItem('localInstitutions') || '[]')
)

const localEvents = ref(
  JSON.parse(localStorage.getItem('localEvents') || '[]')
)

const allInstitutions = computed(() => [
  ...baseInstitutions,
  ...localInstitutions.value
])

const institutionForm = reactive({
  name: '',
  category: '',
  address: '',
  city: 'Vitória/ES',
  description: '',
  latitude: '',
  longitude: ''
})

const eventForm = reactive({
  title: '',
  category: '',
  date: '',
  time: '',
  institutionId: '',
  location: '',
  description: ''
})

watch(
  localInstitutions,
  (value) => {
    localStorage.setItem('localInstitutions', JSON.stringify(value))
  },
  { deep: true }
)

watch(
  localEvents,
  (value) => {
    localStorage.setItem('localEvents', JSON.stringify(value))
  },
  { deep: true }
)

function addInstitution() {
  const newInstitution = {
    id: Date.now(),
    name: institutionForm.name,
    category: institutionForm.category,
    address: institutionForm.address,
    city: institutionForm.city,
    description: institutionForm.description,
    latitude: Number(institutionForm.latitude),
    longitude: Number(institutionForm.longitude)
  }

  localInstitutions.value.push(newInstitution)

  institutionForm.name = ''
  institutionForm.category = ''
  institutionForm.address = ''
  institutionForm.city = 'Vitória/ES'
  institutionForm.description = ''
  institutionForm.latitude = ''
  institutionForm.longitude = ''
}

function addEvent() {
  const newEvent = {
    id: Date.now(),
    title: eventForm.title,
    category: eventForm.category,
    date: eventForm.date,
    time: eventForm.time,
    institutionId: Number(eventForm.institutionId),
    location: eventForm.location,
    description: eventForm.description
  }

  localEvents.value.push(newEvent)

  eventForm.title = ''
  eventForm.category = ''
  eventForm.date = ''
  eventForm.time = ''
  eventForm.institutionId = ''
  eventForm.location = ''
  eventForm.description = ''
}

function clearInstitutions() {
  localInstitutions.value = []
}

function clearEvents() {
  localEvents.value = []
}
</script>

<style scoped>
.admin-view {
  display: grid;
  gap: 2rem;
}

.page-header p {
  color: #6b7280;
}

.admin-grid {
  display: grid;
  gap: 2rem;
}

.form-section,
.list-section {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 14px;
  padding: 1.25rem;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.04);
}

.form {
  display: grid;
  gap: 0.75rem;
}

input,
select,
textarea,
button {
  padding: 0.7rem;
  border-radius: 10px;
  border: 1px solid #d1d5db;
  font: inherit;
  background: white;
}

textarea {
  min-height: 100px;
  resize: vertical;
}

button {
  background: #1f2937;
  color: white;
  border: none;
  cursor: pointer;
}

.list-header {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
  margin-bottom: 1rem;
}

.danger-button {
  background: #991b1b;
  max-width: 240px;
}

.item-list {
  display: grid;
  gap: 0.5rem;
  padding-left: 1.2rem;
}

@media (min-width: 900px) {
  .admin-grid {
    grid-template-columns: 1fr 1fr;
  }

  .list-header {
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
  }
}
</style>