alias ls='ls -GF'

# =============================================================
# Macにおいてデスクトップ通知を表示する
# =============================================================
function display_message () {
  reattach-to-user-namespace osascript -e 'on run argv
    display notification current date as text sound name "Purr" with title item 1 of argv
  end run' -- "$*"
}

function notify () {
  "$@"
  display_message "($?)" "$@"
}
