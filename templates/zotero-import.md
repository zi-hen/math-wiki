{# Zotero Integration 插件导入模板（Nunjucks 语法）。
   配置：Obsidian → Settings → Zotero Integration → Import → Markdown template 指向本文件。
   导入命令产生的文件落在 raw/papers/，文件名 = citation key。
   变量名依据 mgmeyers/obsidian-zotero-integration；不同插件版本字段或有小异，按报错微调即可。 #}
---
citekey: {{citekey}}
title: "{{title}}"
authors: [{% for c in creators %}"{{c.lastName}}, {{c.firstName}}"{% if not loop.last %}, {% endif %}{% endfor %}]
year: {% if date %}{{date | format("YYYY")}}{% endif %}
publication: "{{publicationTitle}}"
volume: "{{volume}}"
pages: "{{pages}}"
doi: {{DOI}}
type: raw-paper
status: unverified
ingested: {{importDate | format("YYYY-MM-DD")}}
tags: [{% for t in tags %}"{{t.tag}}"{% if not loop.last %}, {% endif %}{% endfor %}]
---

# {{title}}

> **Citekey**: `{{citekey}}` · **Type**: {{itemType}}
> **Authors**: {% for c in creators %}{{c.lastName}}, {{c.firstName}}{% if not loop.last %}; {% endif %}{% endfor %}
> **Year**: {% if date %}{{date | format("YYYY")}}{% endif %} · **Publication**: {{publicationTitle}} {{volume}}, {{pages}}
> **DOI**: {{DOI}} · **Zotero URI**: {{uri}}

## Abstract

{{abstractNote}}

## Metadata

- Item type: {{itemType}}
- Date added: {{dateAdded}}
- Tags: {% for t in tags %}#{{t.tag}} {% endfor %}

## PDF Annotations

{% for a in annotations -%}
### p.{{a.page}} · {{a.type}}{% if a.colorName %} · {{a.colorName}}{% endif %}

{% if a.annotatedText -%}
> {{a.annotatedText | replace("\n", "\n> ")}}
{% endif -%}
{% if a.comment -%}
**Note**: {{a.comment}}
{% endif -%}
{% if a.imageRelativePath -%}
![[{{a.imageRelativePath}}]]
{% endif -%}

{% endfor %}

## Attachments

{% for att in pdfAttachments -%}
- [{{att.title}}]({{att.link}})
{% endfor %}

---

> 本文件由 Zotero Integration 自动生成，属 **raw/ 层**，不可手改。
> 摄取时 LLM 读取本文件，在 wiki/sources/{{citekey}}.md 写摘要，并更新相关实体页。
