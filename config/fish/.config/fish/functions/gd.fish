function gd
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end
