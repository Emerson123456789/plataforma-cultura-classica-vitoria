<template>
  <article class="card">
    <div class="card-top">
      <h3>{{ institution.name }}</h3>
      <span class="badge">{{ institution.category }}</span>
    </div>

    <p class="meta">{{ institution.city }}</p>
    <p class="description">{{ institution.description }}</p>

    <RouterLink
      class="details-link"
      :to="`/institutions/${institution.id}`"
    >
      Ver mais
    </RouterLink>
  </article>
</template>

<script setup>
import { RouterLink } from 'vue-router'

defineProps({
  institution: {
    type: Object,
    required: true
  }
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
  background: #eef2ff;
  color: #3730a3;
  padding: 0.35rem 0.65rem;
  border-radius: 999px;
}

.meta {
  margin: 0.75rem 0 0;
  color: #6b7280;
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