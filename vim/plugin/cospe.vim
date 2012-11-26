" cospe.vim: Vim plugin for pasting to cos.pe
" Maintainer:   Felippe Bueno <felippe.bueno@gmail.com>
" Version:      0.1
"
" Thanks To: 
"   - Alexandre Fiori - creator of http://cos.pe
"   - Bartek Ciszkowski Maintainer of dpaste.vim (cospe.vim was copied from his work!)
"
" Usage:
"   :Cospe     create a paste from the current buffer or selection.
"   
" You can also map paste to CTRL + P, just add this to your .vimrc:
" map ^P :Cospe<CR>
" (Where ^P is entered using CTRL + V, CTRL + P in Vim)

function! s:CospeInit()
python << EOF

import vim
import httplib

def new_paste(paste_data):
    """
    The function that does all the magic work
    """

    host = "cos.pe"
    #data = urllib.urlencode(paste_data)
    headers = {"Content-type": "application/form-data" }
    try:
        conn = httplib.HTTPConnection(host)
        conn.request("POST", "", paste_data, headers)
        resp = conn.getresponse()
    except urllib2.URLError:
        return False

    return 'http://%s/%s' % (host, resp.read().split()[1])

def make_utf8(code):
    enc = vim.eval('&fenc') or vim.eval('&enc')
    return code.decode(enc, 'ignore').encode('utf-8')

EOF
endfunction


function! s:Cospeit(line1,line2,count,...)
call s:CospeInit()
python << endpython

# new paste
if vim.eval('a:0') != '1':
    rng_start = int(vim.eval('a:line1')) - 1
    rng_end = int(vim.eval('a:line2'))

    if int( vim.eval('a:count') ):
        code = "\n".join(vim.current.buffer[rng_start:rng_end])
    else:
        code = "\n".join(vim.current.buffer)

    code = make_utf8(code)

    paste_url = new_paste(code)

    if paste_url:
        print "Pasted content to %s" % (paste_url)

        vim.command('setlocal nomodified')
        vim.command('let b:dpaste_url="%s"' % paste_url)
    else:
        print "Could not connect."


endpython
endfunction

command! -range=0 -nargs=* Cospe :call s:Cospeit(<line1>,<line2>,<count>,<f-args>)
