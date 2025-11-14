---
title    : {{title}}
created  : {{format-date now "%Y-%m-%d %H:%M:%S"}}
modified : {{format-date now "%Y-%m-%d %H:%M:%S"}}
tags     : [daily, {{format-date now "%Y"}}, {{format-date now "%Y-%m"}}{{#if extra.tags}}, {{extra.tags}}{{/if}}]
---

# {{title}}


{{content}}

