function os
    switch (uname -s)
    case Darwin Linux FreeBSD NetBSD DragonFly
        eval command uname -s
    case "*"
    	switch (uname -s)
    	case Cygwin
    		eval command uname -s
    	case "*"
    		eval echo "undefined"
    	end
    end
end
