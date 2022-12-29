---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

Education
======
* Ph.D in Marine Biology, UC San Diego, 2026 (expected)
* B.S. in Biology with a Specialization in Bioinformatics, UC San Diego, 2021

Work experience
======
* Summer 2015: Research Assistant
  * Github University
  * Duties included: Tagging issues
  * Supervisor: Professor Git

* Fall 2015: Research Assistant
  * Github University
  * Duties included: Merging pull requests
  * Supervisor: Professor Hub
  
Skills
======
* Programming
  * Python
  * Java
  * C++
  * Bash
  * Version Control
* Bioinformatics
  * (Meta-) Genomics
  * (Meta-) Transcriptomics
  * Phylogenetics
  * Gene Annotation
  * Pipeline Management
* Scientific Writing
* Data Visualization

Publications
======
  <ul>{% for post in site.publications %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
  
Talks
======
  <ul>{% for post in site.talks %}
    {% include archive-single-talk-cv.html %}
  {% endfor %}</ul>
  
Teaching
======
  <ul>{% for post in site.teaching %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
