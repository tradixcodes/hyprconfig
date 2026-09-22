hl.on("hyprland.start", function()
	hl.exec_cmd([[
		swww-daemon &
		disown

		tries=0
		max_tries=50   # 50 * 0.2s = 10s timeout

		until swww query >/dev/null 2>&1; do
			tries=$((tries + 1))
			if [ "$tries" -ge "$max_tries" ]; then
				notify-send -u critical "Wallpaper daemon failed" "swww did not respond after 10s"
				echo "swww failed to start after $max_tries attempts" >&2
				exit 1
			fi
			sleep 0.2
		done

		waypaper --restore
	]] .. " &")
end)
