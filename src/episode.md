---
layout: tags
templateName: tag
eleventyExcludeFromCollections: true
pagination:
    data: collections.episodesPages
    size: 1
    alias: paged
permalink: "episode/{% if paged.number > 1 %}{{ paged.number }}/{% endif %}index.html"
isBasedOn: "https://hazardpodcast.com/episodes/"
eleventyComputed:
    title: "All Episodes{% if paged.number > 1 %} | Page {{paged.number}}{% endif %}"
    description: "All episodes of Hazard"
---
