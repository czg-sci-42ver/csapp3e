#! /bin/awk -f
BEGIN {
	print target_funcs " " start_index " " output
	target_funcs_get = target_funcs
	output_file = output
	select_column_lists = select_column_str
	denominator_get = denominator
	printf("%s:\n", denominator) >> output_file
	print "\n" denominator
	fflush(output_file)
	split(target_funcs_get, func_list, ",")
	split(select_column_lists, select_column_list, ";")
	# https://porthos.tecnico.ulisboa.pt/docs/gawk/gawk_9.html#:~:text=For%20example%2C%20a%20two%2Ddimensional,of%20indices%20into%20one%20string.
	# mutli array -> https://stackoverflow.com/questions/3060600/awk-array-iteration-for-multi-dimensional-arrays
	# no dynamic array: https://stackoverflow.com/questions/4353151/how-to-define-dynamic-array-in-begin-statement-with-awk
	# same as python, no need to define https://stackoverflow.com/questions/24879732/how-define-array-on-awk
	# for (Index=1;Index <= length(select_column_list);Index++){
	for (Index = 1; Index <= length(select_column_list); Index++) {
		split(select_column_list[Index], select_column_tmp, ",")
		# print typeof(select_column_tmp) " type " typeof(Index) " " Index
		for (tmp_index = 1; tmp_index <= length(select_column_tmp); tmp_index++) {
			print "assign " select_column_tmp[tmp_index] " with " tmp_index
			column[Index, tmp_index] = select_column_tmp[tmp_index]
			print column[Index, tmp_index] " Index " Index " tmp_index " tmp_index
		}
	}
}

{
	# print column[1,2] " ; " column[2,2]
	# https://stackoverflow.com/questions/5808971/casting-to-int-in-awk str with %,etc -> int
	# start_index_get  = select_column_list[1] + 0
	# denominator_index  = select_column_list[2] + 0
	for (func_index in func_list) {
		# print column[1,1] " " column[1,2] " " column[2,1] " ; " column[2,2]
		# for (Index=1;Index<=length(select_column_list);Index++){
		# 	print Index ": " column[Index,1] " " column[1,2] " " column[2,1] " ; " column[2,2]
		# }
		func_item = func_list[func_index]
		if (match($0, func_item "$") != 0) {
			print $0 " find " func_list[func_index] "; write to file"
			printf("func %25s: ", $NF) >> output_file
			fflush(output_file)
			# https://stackoverflow.com/questions/14063783/how-to-initialize-an-array-of-arrays-in-awk
			# for (Index in select_column_list){
			for (Index = 1; Index <= length(select_column_list); Index++) {
				printf("%5s, ", $column[Index, 1]) >> output_file
				printf("%5s, ", $column[Index, 2]) >> output_file
				fflush(output_file)
				# for (i = column[Index,1] ; i < column[Index,1]  + 2; ++i) {
				# 	printf("%s, ", $i) >> output_file
				# 	fflush(output_file)
				# }
				print "find match " func_item "; " column[Index, 1] " " column[Index, 2] " type: " typeof($column[Index, 1])
				if (typeof($column[Index, 1]) ~ /strnum/) {
					print "find strnum"
					if ($column[Index, 2] == 0) {
						printf("%s\nabove has error\n", 0) >> output_file
					} else {
						quotient = $column[Index, 1] / $column[Index, 2]
						printf("%10s; ", quotient) >> output_file
						print "output %s with newline\n", quotient
						fflush(output_file)
					}
				}
			}
			printf("\n") >> output_file
		}
	}
}

END {
}

