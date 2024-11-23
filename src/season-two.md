---
layout: tags
templateName: tag
eleventyExcludeFromCollections: true
pagination:
    data: collections.seasonTwoPages
    size: 1
    alias: paged
permalink: "seasons/season-two/{% if paged.number > 1 %}{{ paged.number }}/{% endif %}index.html"
eleventyComputed:
    title: "All Episodes from Season Two{% if paged.number > 1 %} | Page {{paged.number}}{% endif %}"
    description: "All episodes from Season Two of Hazard"
---
