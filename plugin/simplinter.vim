au! Filetype php :au! BufWritePost * :call SimplinterPHP(expand("%:."))

fun! SimplinterPHP(filename)
    let $output = system("php -l ".a:filename)
    if $output == "No syntax errors detected in ".a:filename."\n"
        return
    else
        let $output = substitute($output, "PHP Parse error:  ", "", "")
        let $output = substitute($output, "Errors parsing.*", "", "")
        let $output = "Simplinter: ".$output
        echo $output
    endif
endfun
