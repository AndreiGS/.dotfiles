#!/bin/bash

space=$1

if [ "$space" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi

if [ "$SENDER" = "aerospace_workspace_change" ]; then
  apps=$(aerospace list-windows --format %{app-name} --workspace "$space")

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  sketchybar --set space.$space label="$icon_strip"
fi
