function show_machine_names --description="Show the various names of the computer"
    scutil --get HostName
    scutil --get LocalHostName
    scutil --get ComputerName
end
