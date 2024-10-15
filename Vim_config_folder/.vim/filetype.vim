if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.launch setf xml
  " au! BufNewFile,BufRead *.launch.py setf python3
  au! BufNewFile,BufRead *.urdf setf xml
  au! BufNewFile,BufRead *.xacro setf xml
  au! BufNewFile,BufRead *.sdf  setf xml
  au! BufNewFile,BufRead *.ops  setf bash
augroup END

