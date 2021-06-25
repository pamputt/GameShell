echo "SHELL=$SHELL"

echo
echo "======================================================="
echo

bash --version
bash -c '
export GSH_TMP=.
export GSH_SHELL=bash
export HISTFILE="history"
history -r
export HISTSIZE=50000
export HISTFILESIZE=50000
echo "GSH_TMP=$GSH_TMP, HISTFILE=$HISTFILE"
echo ">>>fc -l"
fc -l
touch A B C
echo ">>>source ./bin/history_start.sh"
source ./bin/history_start.sh
echo "GSH_TMP=$GSH_TMP, HISTFILE=$HISTFILE"
echo ">>>add_cmd ls A"
add_cmd ls A
echo ">>>add_cmd ls B"
add_cmd ls B
echo ">>>add_cmd ls C"
add_cmd ls C
echo ">>>fc -l"
fc -l
echo ">>>history"
history
echo ">>> cat \$HISTFILE"
cat "$HISTFILE"
echo ">>>source ./bin/history_clean.sh"
source ./bin/history_clean.sh
echo ">>>fc -l"
fc -l
rm -f a b c A B C
echo ">>> cat \$HISTFILE"
cat "$HISTFILE"
'

echo
echo "======================================================="
echo

zsh --version
zsh -c '
export GSH_TMP=.
export GSH_SHELL=zsh
export HISTFILE="history"
fc -R "$HISTFILE"
export HISTSIZE=50000
export SAVEHIST=50000
echo "GSH_TMP=$GSH_TMP, HISTFILE=$HISTFILE"
echo ">>>fc -l"
fc -l
touch A B C
echo ">>>source ./bin/history_start.sh"
source ./bin/history_start.sh
echo "GSH_TMP=$GSH_TMP, HISTFILE=$HISTFILE"
echo ">>>add_cmd ls A"
add_cmd ls A
echo ">>>add_cmd ls B"
add_cmd ls B
echo ">>>add_cmd ls C"
add_cmd ls C
echo ">>>add_cmd fc -l"
fc -l
echo ">>>source ./bin/history_clean.sh"
source ./bin/history_clean.sh
echo ">>>fc -l"
fc -l
rm -f a b c A B C
echo ">>> cat \$HISTFILE"
cat "$HISTFILE"
'

