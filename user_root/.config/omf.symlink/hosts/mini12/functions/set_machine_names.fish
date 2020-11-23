function set_machine_names --description="Set the various names of the computer"
    sudo scutil --set HostName "mini12.local"
    sudo scutil --set LocalHostName mini12
    sudo scutil --set ComputerName "Mark’s Mac mini" 
end
