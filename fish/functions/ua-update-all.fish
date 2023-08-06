function ua-update-all --wraps=export\ TMPFILE=\"\$\(mktemp\)\"\;\ \\\n\ \ \ \ sudo\ true\;\ \\\n\ \ \ \ rate-mirrors\ --save=\$TMPFILE\ arch\ --max-delay=21600\ \\\n\ \ \ \ \ \ \&\&\ sudo\ mv\ /etc/pacman.d/mirrorlist\ /etc/pacman.d/mirrorlist-backup\ \\\n\ \ \ \ \ \ \&\&\ sudo\ mv\ \$TMPFILE\ /etc/pacman.d/mirrorlist\ \\\n\ \ \ \ \ \ \&\&\ ua-drop-caches\ \\\n\ \ \ \ \ \ \&\&\ yay\ -Syyu\ --noconfirm --description alias\ ua-update-all=export\ TMPFILE=\"\$\(mktemp\)\"\;\ \\\n\ \ \ \ sudo\ true\;\ \\\n\ \ \ \ rate-mirrors\ --save=\$TMPFILE\ arch\ --max-delay=21600\ \\\n\ \ \ \ \ \ \&\&\ sudo\ mv\ /etc/pacman.d/mirrorlist\ /etc/pacman.d/mirrorlist-backup\ \\\n\ \ \ \ \ \ \&\&\ sudo\ mv\ \$TMPFILE\ /etc/pacman.d/mirrorlist\ \\\n\ \ \ \ \ \ \&\&\ ua-drop-caches\ \\\n\ \ \ \ \ \ \&\&\ yay\ -Syyu\ --noconfirm
  export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && ua-drop-caches \
      && yay -Syyu --noconfirm $argv
        
end
