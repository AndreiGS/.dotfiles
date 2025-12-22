#!/bin/bash

if [ "$SENDER" = "space_windows_change" ]; then
    for space in $(aerospace list-workspaces --all); do
      apps=$(aerospace list-windows --format %{app-name} --workspace $space)

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
    done
fi
