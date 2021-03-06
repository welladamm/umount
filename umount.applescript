set assets to "assets"
set finder to "Finder"
set adrs to "smb://guest:@10.232.39.168/assets/"
set scpt to "ls /Volumes/assets"

tell application "Finder"
	if disk assets exists then
		
		set content to do shell script scpt
		
		if (0 = length of content) then

			eject disk assets

			try
				mount volume point
				display alert "Remounted successfully."

			on error err
				display dialog "Failed to remount: " & err

			end try
			
		else

			display alert "Already mounted"

		end if
		
	else
		try
			mount volume adrs
			display alert "Mounted successfully."
			do shell script scpt

		on error err

			display dialog "Failed to mount: " & err
			
		end try		
	end if
end tell
