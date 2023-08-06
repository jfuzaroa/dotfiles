function wt --wraps='wt.exe -w 0 nt -d' --wraps='wt.exe -w 0 nt -d .' --description 'alias wt=wt.exe -w 0 nt -d .'
  wt.exe -w 0 nt -d . $argv
        
end
