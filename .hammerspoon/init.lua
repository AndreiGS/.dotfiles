hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
  local yabai_status = hs.execute("pgrep -x yabai", true) -- Check if Yabai is running
  local skhd_status = hs.execute("pgrep -x skhd", true) -- Check if SKHD is running
  if yabai_status == "" or skhd_status == "" then
    hs.execute("yabai --start-service", true)  -- Start Yabai if not running
    hs.execute("skhd --start-service", true)  -- Start SKHD if not running
    hs.alert.show("WM ON")
  else
    hs.execute("yabai --stop-service", true)   -- Stop Yabai if running
    hs.execute("skhd --stop-service", true)   -- Stop SKHD if running
    hs.alert.show("WM OFF")
  end
end)

hs.hotkey.bind({"cmd"}, "W", function()
  hs.alert.show("Hello World!")
end)
