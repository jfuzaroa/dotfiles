function ua-drop-caches --wraps='sudo paccache -rk3; yay -Sc --aur --noconfirm' --description 'alias ua-drop-caches=sudo paccache -rk3; yay -Sc --aur --noconfirm'
  sudo paccache -rk3; yay -Sc --aur --noconfirm $argv
        
end
