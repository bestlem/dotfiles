function rmquarantine
	xattr -dr com.apple.quarantine  $argv
end
