---
layout: tags
templateName: tag
eleventyExcludeFromCollections: true
pagination:
    data: collections.episodesPages
    size: 1
    alias: paged
permalink: "episodes/{% if paged.number > 1 %}{{ paged.number }}/{% endif %}index.html"
eleventyComputed:
    title: "All Episodes{% if paged.number > 1 %} | Page {{paged.number}}{% endif %}"
    description: "Episodes of Hazard"
---
