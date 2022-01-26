## Countervalue Service

### Last report

- [report](/qa-backend-tests/CounterValueService/report.html)
- [log](/qa-backend-tests/CounterValueService/log.html)
- [output](/qa-backend-tests/CounterValueService/output.xml)

{% assign doclist = site.pages | sort: 'url'  %}
<ul>
{% for doc in doclist %}
{% if doc.name contains '.md' or doc.name contains '.html' %}
<li><a href="{{ site.baseurl }}{{ doc.url }}">{{ doc.url }}</a></li>
{% endif %}
{% endfor %}
</ul>