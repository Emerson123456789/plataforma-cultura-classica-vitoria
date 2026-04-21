<template>
  <article class="card">
    <div class="card-top">
      <h3>{{ event.title }}</h3>
      <span class="badge">{{ event.category }}</span>
    </div>

    <p class="meta"><strong>Data:</strong> {{ formattedDate }} às {{ event.time }}</p>
    <p class="meta"><strong>Local:</strong> {{ event.location }}</p>
    <p class="description">{{ event.description }}</p>

    <RouterLink
      class="details-link"
      :to="`/events/${event.id}`"
    >
      Ver mais
    </RouterLink>
  </article>
</template>

<script setup>
import { computed } from 'vue'
import { RouterLink } from 'vue-router'

const props = defineProps({
  event: {
    type: Object,
    required: true
  }
})

const formattedDate = computed(() => {
  const [year, month, day] = props.event.date.split('-')
  return `${day}/${month}/${year}`
})
</script>

<style scoped>
.card {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 14px;
  padding: 1.1rem;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.04);
}

.card-top {
  display: flex;
  justify-content: space-between;
  align-items: start;
  gap: 0.75rem;
}

.card-top h3 {
  margin: 0;
  font-size: 1.05rem;
}

.badge {
  white-space: nowrap;
  font-size: 0.85rem;
  background: #fef3c7;
  color: #92400e;
  padding: 0.35rem 0.65rem;
  border-radius: 999px;
}

.meta {
  margin: 0.75rem 0 0;
  color: #4b5563;
  font-size: 0.95rem;
}

.description {
  margin: 0.9rem 0 0;
  color: #374151;
  line-height: 1.5;
}

.details-link {
  display: inline-block;
  margin-top: 1rem;
  padding: 0.55rem 0.8rem;
  background: #1f2937;
  color: white;
  border-radius: 8px;
}
</style>