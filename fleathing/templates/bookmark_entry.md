```fleathing-form
title: title
url: required
source
context
notes: body
```
---
title: {{title}}
url: {{url}}
source: {{source}}
context: {{context}}
created: {{date}}
tags: 
- bookmark
{{tags:yaml-list}}
---
{{#body}}
notes: {{body}}
{{/body}}
