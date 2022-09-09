---
layout: page
permalink: /publications/
title: Research
description: Notation ' * ' denotes Alphabetical ordering. Notation '-W' denotes Workshops.
years: [2022, 2020, 2019]
nav: true
nav_order: 1
---
<!-- _pages/publications.md -->
<div class="publications">

{%- for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
