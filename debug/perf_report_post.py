import sys
import getopt
import os
import re

# remove_start=len('L1-dcache-load-misses, L1-dcache-loads, L1-dcache-prefetches, L1-icache-load-misses, L1-icache-loads, dTLB-load-misses, dTLB-loads, iTLB-load-misses, iTLB-loads, l2_request_g2.group1, l2_request_g1.group2, l2_request_g1.all_no_prefetch, ic_cache_fill_l2, ic_cache_fill_sys, ic_cache_inval.fill_invalidated, ic_cache_inval.l2_invalidating_probe, l2_cache_req_stat.ic_access_in_l2, l2_cache_req_stat.ic_dc_hit_in_l2, l2_cache_req_stat.ic_dc_miss_in_l2, l2_cache_req_stat.ic_fill_hit_s, l2_cache_req_stat.ic_fill_h'.split(","))
remove_start_parent = len('L1-dcache-load-misses:u\
    ,L1-dcache-loads:u,L1-dcache-prefetches:u\
    ,L1-icache-load-misses:u,L1-icache-loads:u\
    ,dTLB-load-misses:u,dTLB-loads:u\
    ,iTLB-load-misses:u,iTLB-loads:u,\
    l2_request_g2.group1,l2_request_g1.group2\
    ,l2_request_g1.all_no_prefetch\
    ,ic_cache_fill_l2,ic_cache_fill_sys\
    ,ic_cache_inval.fill_invalidated,ic_cache_inval.l2_invalidating_probe\
    ,l2_cache_req_stat.ic_access_in_l2,l2_cache_req_stat.ic_dc_hit_in_l2,l2_cache_req_stat.ic_dc_miss_in_l2\
    ,l2_cache_req_stat.ic_fill_hit_s,l2_cache_req_stat.ic_fill_hit_x,l2_cache_req_stat.ic_fill_miss\
    ,l2_cache_req_stat.ls_rd_blk_c,l2_cache_req_stat.ls_rd_blk_cs\
    ,l2_cache_req_stat.ls_rd_blk_l_hit_s,l2_cache_req_stat.ls_rd_blk_l_hit_x\
    ,l2_cache_req_stat.ls_rd_blk_x\
    ,l2_cache_hits_from_l2_hwpf,l2_pf_miss_l2_hit_l3,l2_pf_miss_l2_l3\
    ,l2_request_g2.ls_rd_sized,l2_request_g2.ls_rd_sized_nc\
    ,ls_hw_pf_dc_fill.ls_mabresp_lcl_cache,ls_hw_pf_dc_fill.ls_mabresp_lcl_dram\
    ,ls_hw_pf_dc_fill.ls_mabresp_lcl_l2\
    ,ls_hw_pf_dc_fill.ls_mabresp_rmt_cache,ls_hw_pf_dc_fill.ls_mabresp_rmt_dram\
    ,ls_refills_from_sys.ls_mabresp_lcl_cache,ls_refills_from_sys.ls_mabresp_lcl_dram\
    ,ls_refills_from_sys.ls_mabresp_lcl_l2\
    ,ls_refills_from_sys.ls_mabresp_rmt_cache,ls_refills_from_sys.ls_mabresp_rmt_dram\
    ,ls_st_commit_cancel2.st_commit_cancel_wcb_full\
    ,ls_sw_pf_dc_fill.ls_mabresp_lcl_cache,ls_sw_pf_dc_fill.ls_mabresp_lcl_dram\
    ,ls_sw_pf_dc_fill.ls_mabresp_lcl_l2\
    ,ls_sw_pf_dc_fill.ls_mabresp_rmt_cache,ls_sw_pf_dc_fill.ls_mabresp_rmt_dram\
    ,de_dis_uops_from_decoder.opcache_dispatched\
    ,l2_request_g1.rd_blk_l,l2_request_g1.rd_blk_x\
    ,l2_request_g1.ls_rd_blk_c_s\
    ,l2_request_g1.cacheable_ic_read\
    ,l2_request_g1.change_to_x\
    ,l2_request_g1.prefetch_l2_cmd\
    ,l2_request_g1.l2_hw_pf\
    ,l2_request_g1.group2\
    ,l2_request_g2.group1'.split(","))
remove_end_parent = remove_start_parent*2
remove_start_child_parent = 0
remove_end_child_parent = remove_end_parent

# https://www.tutorialspoint.com/python/python_command_line_arguments.htm

IGNORE_EXTRA = False

def parse_arg(argv: list[str]) -> list[str]:
    cur_script_file = os.path.relpath(__file__, os.getcwd())
    inputfile = ''
    outputfile = ''
    print("args: ", argv)
    opts, args = getopt.getopt(argv, "hi:o:", ["ifile=", "ofile="])
    for opt, arg in opts:
        if opt == '-h':
            print(cur_script_file, '-i <inputfile> -o <outputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg
    print('Input file is ', inputfile)
    print('Output file is ', outputfile)
    print("arg1 should be file name")
    return [inputfile, outputfile]


"""
ignore_events: [start_1,end_1,start_2,end_2,...]
"""


def main(argv, remove_start: int, remove_end: int, inputfile: str, outputfile: str, target_inc:int,check_str: str,ignore_events: list[int]=[],):
    TARGET_FILE = inputfile
    print("remove_start: ", remove_start)
    if (outputfile == ''):
        sys.exit("need output file")
    with open(TARGET_FILE, "r+") as file, open(outputfile, "w+") as file_2:
        # https://stackoverflow.com/questions/2081836/how-to-read-specific-lines-from-a-file-by-line-number
        data = file.readlines()
        data_output = ''
        skip = False
        # print(data)
        # for target_line_index in range(12, 43+1):
        for target_line_index in range(len(data)):
            target_line = data[target_line_index]
            target_line_func_line=(target_line_index+target_inc)
            touch_end = target_line_func_line >= len(data)
            start_with_num = len(re.findall(r"^ *\d+", target_line)) > 0
            if not touch_end:
                # try:
                target_line_func = data[target_line_func_line]
                # except IndexError:
                #     print("target_line_func_line: ",target_line_func_line,". while data len: ",len(data))
                
                """
                this is specific to conditions with `hierarchy` like `$ perf report -i ~/perf_log/l2_cache_req_stat_ic_cache_fill_etc.log --group --stdio -n --hierarchy` 

                only change `skip` when with number start.
                """
                if start_with_num and (len(re.findall(r"^ {10,}\d", target_line)) > 0):
                    print("found target_line and target_line_func: ",target_line_func,"check_str")
                    find_dgemm = target_line_func.find(check_str) != -1
                    if find_dgemm :
                        print(target_line_func)
                    skip = not find_dgemm# type: ignore
            if skip:
                # data_output = data_output+target_line
                continue
            else:
                # print(target_line_index, "th line: ", target_line)
                if start_with_num == 0:
                    print("no change:", target_line)
                    data_output = data_output+target_line
                else:
                    target_line_changed = re.split(r"( *\d+\.\d+\%)", target_line)
                    for split_elem in target_line_changed:
                        if split_elem == '':
                            target_line_changed.remove(split_elem)
                    # print("target_rm_start: ",target_line_changed[remove_start],"after ",target_line_changed[remove_start-1])

                    # target_line_changed_str = "".join([target_line_changed[index] for index in range(len(
                    #     target_line_changed)) if not ((index >= remove_start) and (index < remove_end) and (all(index >= ignore_events[sub_index] for sub_index in range(len(ignore_events)) if sub_index %2 == 0)))])
                    target_line_changed_str_list = []
                    for index in range(len(target_line_changed)):
                        found_first_rm=((index >= remove_start) and (index < remove_end))
                        if found_first_rm:
                            continue
                        if IGNORE_EXTRA:
                            if not found_first_rm:
                                bool_set = [(index >= ignore_events[sub_index]) and (
                                    index < ignore_events[sub_index+1]) for sub_index in range(len(ignore_events)) if sub_index % 2 == 0]
                                if True in bool_set:
                                    continue
                        target_line_changed_str_list.append(
                            target_line_changed[index])
                    target_line_changed_str = "".join(target_line_changed_str_list)
                    print("after change: ", target_line_changed_str)
                    data_output = data_output+target_line_changed_str
        # print(data_output)
        file_2.write(data_output)


if __name__ == "__main__":
    if len(sys.argv) == 1:
        sys.exit("need params, use `-h` to view usage")
    else:
        [inputfile, outputfile] = parse_arg(argv=sys.argv[1:])
        target_inc = 5
        check_str = "dgemm"
        if IGNORE_EXTRA:
            if "child" in outputfile:
                main(sys.argv[1:], remove_start=remove_start_parent,
                    remove_end=remove_end_parent, inputfile=inputfile, outputfile=outputfile, ignore_events=[0, 9],target_inc=target_inc,check_str=check_str)
            elif "sample" in outputfile:
                main(sys.argv[1:], remove_start=remove_start_child_parent,
                    remove_end=remove_end_child_parent, inputfile=inputfile, outputfile=outputfile, ignore_events=[0, 9],target_inc=target_inc,check_str=check_str)
        else:
            if "child" in outputfile:
                main(sys.argv[1:], remove_start=remove_start_parent,
                    remove_end=remove_end_parent, inputfile=inputfile, outputfile=outputfile,target_inc=target_inc,check_str=check_str)
            elif "sample" in outputfile:
                main(sys.argv[1:], remove_start=remove_start_child_parent,
                    remove_end=remove_end_child_parent, inputfile=inputfile, outputfile=outputfile,target_inc=target_inc,check_str=check_str)
