# Start services
exec $notify
#exec_always --no-startup-id workstyle &> /tmp/workstyle.log

## Show pressed keys
#exec wshowkeys -F 'monospace 12' -a bottom -a right


## Set up workspaces
exec chromium && sway '[app_class="Chromium"]' move workspace 1

exec code && sway '[app_class="Code"]' move workspace 5

exec signal-desktop && sway '[app_class="Signal"]' move workspace 9
