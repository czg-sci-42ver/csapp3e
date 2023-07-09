#! /bin/awk -f
BEGIN {
	print target_funcs " " start_index " " output
	target_funcs_get = target_funcs
	output_file = output
	select_column = select_column_str
	denominator_get = denominator
	printf("%s:\n", denominator) >> output_file
	print "\n" denominator
	fflush(output_file)
}

{
	print "begin"
	split(target_funcs_get, func_list, ",")
	split(select_column, select_column_list, ",")
	start_index_get = select_column_list[1] + 0
	denominator_index = select_column_list[2] + 0
	print "begin"
	for (Index in func_list) {
		func_item = func_list[Index]
		print "^" func_item "$" "\n"
		if (match($0, func_item"$") != 0) {
			print $0 " find " func_list[Index] "; write to file"
			printf("func %s: ", $NF) >> output_file
			fflush(output_file)
			printf("%s, ", $start_index_get) >> output_file
			printf("%s, ", $denominator_index) >> output_file
			fflush(output_file)
			# for (i = start_index_get; i < start_index_get + 2; ++i) {
			# 	printf("%s, ", $i) >> output_file
			# 	fflush(output_file)
			# }
			print "find match " func_item "; " select_column_list[1] " type: " typeof($start_index_get)
			if (typeof($start_index_get) ~ /strnum/) {
				print "find strnum"
				if ($denominator_index == 0) {
					printf("%s\nabove has error\n", 0) >> output_file
				} else {
					quotient = $start_index_get / $denominator_index
					printf("%s\n", quotient) >> output_file
					print "output %s with newline\n", quotient
					fflush(output_file)
				}
			}
		}
	}
}

END {
}

