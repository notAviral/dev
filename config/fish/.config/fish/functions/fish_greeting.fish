function fish_greeting
	echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime | sed 's/^.*up  *\([^,]*\),.*/\1/' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo

	if command -q ip
		echo -e " \\e[1mNetwork:\\e[0m"
		echo -ne (\
			ip addr show up scope global | \
				grep -E ': <|inet' | \
				sed \
					-e 's/^[[:digit:]]\+: //' \
					-e 's/: <.*//' \
					-e 's/.*inet[[:digit:]]* //' \
					-e 's/\/.*//'| \
				awk 'BEGIN {i=""} /\.|:/ {print i" "$0"\\\n"; next} // {i = $0}' | \
				sort | \
				column -t -R1 | \
				sed 's/ \([^ ]\+\)$/ \\\e[4m\1/' | \
				sed 's/m\(\(10\.\|172\.\(1[6-9]\|2[0-9]\|3[01]\)\|192\.168\.\).*\)/m\\\e[24m\1/' | \
				sed 's/^\( *[^ ]\+\)/\\\e[36m\1/' | \
				sed 's/\(\(en\|em\|eth\)[^ ]* .*\)/\\\e[39m\1/' | \
				sed 's/\(wl[^ ]* .*\)/\\\e[35m\1/' | \
				sed 's/\(ww[^ ]* .*\).*/\\\e[33m\1/' | \
				sed 's/$/\\\e[0m/' | \
				sed 's/^/\t/' \
			)
		echo
	end

	set -l todo_file ~/todo.md
	set -l now (date +%s)
	set -l todos
	set -l backlog

    if test -f $todo_file
        for line in (awk '
            /^# / {
            if (title != "") print title "\t" deadline
                title = substr($0, 3)
                deadline = ""
                next
                }
                /^## / { deadline = substr($0, 4); next }
                END { if (title != "") print title "\t" deadline }
                ' $todo_file)
                set -l title (string trim (echo $line | cut -f1))
                set -l deadline (string trim (echo $line | cut -f2))
                set -l entry "[$deadline] : $title"

                set -l dsec ""
                if test -n "$deadline"
                    set -l dparts (string split - $deadline)
                    if test (count $dparts) -eq 3
                        set dsec (date -d "$dparts[3]-$dparts[2]-$dparts[1]" +%s 2>/dev/null)
                    end
                end

                if test -n "$dsec"; and test $dsec -lt $now
                    set backlog $backlog $entry
                else
                    set todos $todos $entry
                end
            end
        end

        if test (count $backlog) -gt 0
            echo -e " \e[1mBacklog\e[0m"
            set_color yellow
            for e in $backlog
                echo "  $e"
            end
            set_color normal
            echo
        end

        if test (count $todos) -gt 0
            echo -e " \e[1mTODOs\e[0m"
            set_color green
            for e in $todos
                echo "  $e"
            end
            set_color normal
            echo
        end
    end
