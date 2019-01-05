---
layout: main
permalink: /
---

# Доступные материалы

{% for category in site.categories %}
### {{ category[0] | capitalize }}
<ul>
  {% for post in category[1] %}
  <li><a href="{{ post.url }}">{{post.title}}</a></li>
  {% endfor %}
</ul>

{% endfor %}
