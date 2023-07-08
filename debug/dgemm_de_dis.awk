#! /bin/awk -f
BEGIN {
	print target_funcs " " start_index " " output
	target_funcs_get = target_funcs
	start_index_get = start_index
	output_file = output
	denominator_get = denominator
	printf("%s:\n", denominator) >> output_file
	print denominator
	fflush(output_file)
}

{
	split(target_funcs_get, func_list, ",")
	for (Index in func_list) {
		func_item = func_list[Index]
		if (match($0, func_item) != 0) {
			print $0 " find " func_list[Index] "; write to file"
			printf("func %s: ", $NF) >> output_file
			fflush(output_file)
			for (i = start_index_get; i < start_index_get + 2; ++i) {
				printf("%s, ", $i) >> output_file
				fflush(output_file)
			}
			denominator_index = start_index_get + 1
			if (typeof($start_index_get) ~ /strnum/) {
				if ($denominator_index == 0) {
					printf("%s\nabove has error\n", 0) >> output_file
				} else {
					quotient = $start_index_get / $denominator_index
					printf("%s\n", quotient) >> output_file
					fflush(output_file)
				}
			}
		}
	}
}

END {
}

