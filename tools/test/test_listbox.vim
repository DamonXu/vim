"----------------------------------------------------------------------
" testing suit
"----------------------------------------------------------------------
if 1
	let lines = [
				\ "[1]\tOpen &File\t(F3)",
				\ "[2]\tChange &Directory\t(F2)",
				\ "[3]\tHelp",
				\ "",
				\ "[4]\tE&xit",
				\ "[4]\t哈哈哈E&xit",
				\ ]
	for ix in range(1000)
		let lines += ['line: ' . ix]
	endfor
	function! MyCallback(code)
		let hwnd = g:quickui#listbox#current
		let context = hwnd.context
		echo "exit: ". a:code . ' context: '. context . ' in: ' . hwnd.input
	endfunc
	let opts = {'title':'Select', 'border':1, 'index':400, 'close':'button'}
	let opts.context = 'asdfasdf'
	let opts.callback = 'MyCallback'
	let opts.keymap = {'=':'INPUT-2', '-':'INPUT-3'}
	if 1
		let inst = quickui#listbox#create(lines, opts)
		call popup_show(inst.winid)
	else
		let code = quickui#listbox#inputlist(lines, opts)
		echo "code: " . code
	endif
endif

if 0
	let content = [
				\ [ 'echo 1', 'echo 100' ],
				\ [ 'echo 2', 'echo 200' ],
				\ [ 'echo 3', 'echo 300' ],
				\ [ 'echo 4' ],
				\ [],
				\ [ 'echo 5', 'echo 500' ],
				\]
	let opts = {'title': 'select'}
	call quickui#listbox#any(content, opts)
endif



