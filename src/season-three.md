---
layout: tags
templateName: tag
eleventyExcludeFromCollections: true
pagination:
    data: collections.seasonThreePages
    size: 1
    alias: paged
permalink: "seasons/season-three/{% if paged.number > 1 %}{{ paged.number }}/{% endif %}index.html"
eleventyComputed:
    title: "All Episodes from Season Three{% if paged.number > 1 %} | Page {{paged.number}}{% endif %}"
    description: "All episodes from Season Three of Hazard"
---
