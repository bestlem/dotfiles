function rmquarantine --description="Remove quarantine flags"    
	xattr -dr com.apple.quarantine  $argv
end
