plugin_load "exit_code"
plugin_load "git"
plugin_load "python_venv"

color "yellow"
python_venv
color "reset"
color "bright_green"
username
text " "
color "reset"
color "blue"
folder
text " "
color "reset"
color "red"
git_branch
git_status
color "reset"
color "magenta"
exit_code
text "❯ "
color "reset"
update
