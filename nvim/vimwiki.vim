let wiki_default = {}

let personal = {}
let personal.path = '~/wiki-personal/'
let personal.name = 'Personal'
let personal.syntax = 'markdown'
let personal.ext = 'md'

let work = {}
let work.path = '~/wiki-work/'
let work.name = 'Work'
let work.syntax = 'markdown'
let work.ext = 'md'

let g:vimwiki_list = [wiki_default, personal, work]
