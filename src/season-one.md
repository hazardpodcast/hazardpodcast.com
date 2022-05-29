---
layout: tags
templateName: tag
eleventyExcludeFromCollections: true
pagination:
    data: collections.seasonOnePages
    size: 1
    alias: paged
permalink: "seasons/season-one/{% if paged.number > 1 %}{{ paged.number }}/{% endif %}index.html"
eleventyComputed:
    title: "All Episodes from Season One{% if paged.number > 1 %} | Page {{paged.number}}{% endif %}"
    description: "All episodes from Season One of Hazard"
---
