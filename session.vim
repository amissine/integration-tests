let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/product/integration-tests
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +13 .travis.yml
badd +1 script.sh
badd +13 container/Dockerfile
badd +1 container/dependencies.sh
badd +1 container/start.sh
badd +1 monitor.js
badd +49 container/index.js
badd +1 container/tests/index.js
badd +1 container1.env
badd +1 ngrok.yml
badd +1 docker-compose.yml
badd +1 container2.env
badd +1 container/compliance.cfg
badd +23 container/bridge.cfg
badd +15 local.sh
badd +20 container/tests/credit_payment_test.js
badd +26 container/tests/test.js
badd +8 container/package.json
badd +8 container/checkAccount.js
badd +1 createAccount.js
badd +14 checkAccount.js
badd +9 package.json
badd +17 .notravis.yml
badd +1 https-proxy.js
badd +6 checkIssuer.js
badd +43 useIssuer.js
badd +0 container/tests/xlm_payment_test.js
badd +67 container/tests/pending_test.js
argglobal
silent! argdel *
$argadd .travis.yml
set stal=2
edit container/dependencies.sh
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
3wincmd k
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 10 + 24) / 48)
exe '2resize ' . ((&lines * 11 + 24) / 48)
exe '3resize ' . ((&lines * 11 + 24) / 48)
exe '4resize ' . ((&lines * 10 + 24) / 48)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 4 - ((2 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 062|
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/container/Dockerfile
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 13 - ((7 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 065|
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/script.sh
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/local.sh
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 2 - ((1 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 048|
lcd ~/product/integration-tests
wincmd w
exe '1resize ' . ((&lines * 10 + 24) / 48)
exe '2resize ' . ((&lines * 11 + 24) / 48)
exe '3resize ' . ((&lines * 11 + 24) / 48)
exe '4resize ' . ((&lines * 10 + 24) / 48)
tabedit ~/product/integration-tests/container2.env
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
3wincmd k
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 5 + 24) / 48)
exe '2resize ' . ((&lines * 16 + 24) / 48)
exe '3resize ' . ((&lines * 16 + 24) / 48)
exe '4resize ' . ((&lines * 5 + 24) / 48)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 2) / 5)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/useIssuer.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/docker-compose.yml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/container1.env
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 5 - ((4 * winheight(0) + 2) / 5)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 072|
lcd ~/product/integration-tests
wincmd w
exe '1resize ' . ((&lines * 5 + 24) / 48)
exe '2resize ' . ((&lines * 16 + 24) / 48)
exe '3resize ' . ((&lines * 16 + 24) / 48)
exe '4resize ' . ((&lines * 5 + 24) / 48)
tabedit ~/product/integration-tests/container/start.sh
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 14 + 24) / 48)
exe '2resize ' . ((&lines * 15 + 24) / 48)
exe '3resize ' . ((&lines * 14 + 24) / 48)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/container/bridge.cfg
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/container/compliance.cfg
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/product/integration-tests
wincmd w
exe '1resize ' . ((&lines * 14 + 24) / 48)
exe '2resize ' . ((&lines * 15 + 24) / 48)
exe '3resize ' . ((&lines * 14 + 24) / 48)
tabedit ~/product/integration-tests/container/tests/index.js
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 14 + 24) / 48)
exe '2resize ' . ((&lines * 14 + 24) / 48)
exe '3resize ' . ((&lines * 15 + 24) / 48)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 8 - ((7 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 0
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/monitor.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 72 - ((6 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
72
normal! 012|
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/container/index.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 105 - ((14 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
105
normal! 0
lcd ~/product/integration-tests
wincmd w
exe '1resize ' . ((&lines * 14 + 24) / 48)
exe '2resize ' . ((&lines * 14 + 24) / 48)
exe '3resize ' . ((&lines * 15 + 24) / 48)
tabedit ~/product/integration-tests/https-proxy.js
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 14 + 24) / 48)
exe '2resize ' . ((&lines * 14 + 24) / 48)
exe '3resize ' . ((&lines * 15 + 24) / 48)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 32 - ((6 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
32
normal! 027|
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/checkAccount.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/product/integration-tests
wincmd w
argglobal
edit ~/product/integration-tests/container/tests/test.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 26 - ((12 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
26
normal! 0
lcd ~/product/integration-tests
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 14 + 24) / 48)
exe '2resize ' . ((&lines * 14 + 24) / 48)
exe '3resize ' . ((&lines * 15 + 24) / 48)
tabnext 5
set stal=1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
