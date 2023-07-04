"""
use the following bash script to auto feed `events_num`:
dir=/mnt/ubuntu/home/czg/csapp3e;\
file=no_prefetch_l2_opcache;\
events=l2_cache_req_stat.ls_rd_blk_c,l2_cache_req_stat.ls_rd_blk_cs\
,l2_cache_req_stat.ls_rd_blk_l_hit_s,l2_cache_req_stat.ls_rd_blk_l_hit_x\
,l2_cache_req_stat.ls_rd_blk_x\
,de_dis_uops_from_decoder.opcache_dispatched,de_dis_uops_from_decoder.decoder_dispatched;\
events_num=$(echo ${events} | awk -F "," "{print NF}" -);\
cd;perf record -g --call-graph fp -e ${events}\
 ~/matrix-matrix-multiply/build/src/dgemm;\
mv perf.data ~/perf_log/${file}.log;\
perf report -i ~/perf_log/${file}.log --group --stdio -n --hierarchy > ${dir}/debug/${file}.report
python ${dir}/debug/perf_report_post.py -i ${dir}/debug/${file}.report -o ${dir}/debug/sample_num_${file}.report -n ${events_num}
"""

from typing import Final
import sys
import getopt
import os
import re

PREFETCH = True
L2CHACHE = False
USE_HIERARCHY = True
IGNORE_EXTRA = False

# tuple immutable https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences


def set_event_num(event_num: int) -> tuple[int, int, int, int]:
    REMOVE_START_CHILD_PARENT = 0
    # https://stackoverflow.com/questions/2682745/how-do-i-create-a-constant-in-python
    REMOVE_START_PARENT: Final[int] = event_num*2
    """
    USE_HIERARCHY -> then parent not exists.
    """
    if USE_HIERARCHY:
        REMOVE_END_PARENT = REMOVE_START_PARENT
    else:
        REMOVE_END_PARENT = REMOVE_START_PARENT*2
    REMOVE_END_CHILD_PARENT = REMOVE_END_PARENT
    return REMOVE_START_PARENT, REMOVE_END_PARENT, REMOVE_START_CHILD_PARENT, REMOVE_END_CHILD_PARENT


def parse_arg(argv: list[str]) -> tuple[str, str, int, int, int, int]:
    cur_script_file = os.path.relpath(__file__, os.getcwd())
    inputfile = ''
    outputfile = ''
    event_num = 0
    print("args: ", argv)
    opts, args = getopt.getopt(argv, "hi:o:n:", ["ifile=", "ofile=", "num="])
    for opt, arg in opts:
        if opt == '-h':
            print(cur_script_file, '-i <inputfile> -o <outputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            print(arg)
            outputfile = arg
        elif opt in ("-n", "--num"):
            print(type(arg), arg)
            event_num = int(arg)
    print('Input file is ', inputfile)
    print('Output file is ', outputfile)
    print("events num is ", event_num)
    REMOVE_START_PARENT, REMOVE_END_PARENT, REMOVE_START_CHILD_PARENT, REMOVE_END_CHILD_PARENT = set_event_num(
        event_num=event_num)
    print("arg1 should be file name")
    return inputfile, outputfile, REMOVE_START_PARENT, REMOVE_END_PARENT, REMOVE_START_CHILD_PARENT, REMOVE_END_CHILD_PARENT


"""
ignore_events: [start_1,end_1,start_2,end_2,...]
"""
ONLY_KEEP_START_NUM = True
if ONLY_KEEP_START_NUM:
    print("enable ONLY_KEEP_START_NUM")

DEBUG_DICT = {"show_skip": True,
              "show_no_change": False, "show_after_change": False}


def main(argv, remove_start: int, remove_end: int, inputfile: str, outputfile: str, target_inc: int, check_str: str, drop_child: bool, ignore_events: list[int] = []):
    TARGET_FILE = inputfile
    find_first_start_num = False
    print("remove_start: ", remove_start, "remove_end: ", remove_end)
    if (outputfile == ''):
        sys.exit("need output file")
    with open(TARGET_FILE, "r+") as file, open(outputfile, "w+") as file_2:
        # https://stackoverflow.com/questions/2081836/how-to-read-specific-lines-from-a-file-by-line-number
        data = file.readlines()
        data_output = ''
        skip_row = False
        # print(data)
        # for target_line_index in range(12, 43+1):
        for target_line_index in range(len(data)):
            target_line = data[target_line_index]
            target_line_func_line = (target_line_index+target_inc)
            touch_end = target_line_func_line >= len(data)
            start_with_num = len(re.findall(r"^ *\d+", target_line)) > 0
            if start_with_num:
                find_first_start_num = True
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
                    # print("found target_line and target_line_func: ",
                    #       target_line_func, "check_str")
                    find_dgemm = target_line_func.find(check_str) != -1
                    # if find_dgemm:
                    #     print(target_line_func)
                    skip_row = not find_dgemm  # type: ignore
            if skip_row:
                # data_output = data_output+target_line
                if DEBUG_DICT["show_skip"]:
                    print("skip row", target_line)
                continue
            else:
                # print(target_line_index, "th line: ", target_line)
                if start_with_num == 0:
                    if DEBUG_DICT["show_no_change"]:
                        print("no change:", target_line)
                    if ONLY_KEEP_START_NUM and find_first_start_num:
                        continue
                    else:
                        data_output = data_output+target_line
                else:
                    # target_line_changed = re.split(r"(^ *)( *)(\d+\.\d+\%)", target_line)

                    # start_margin = re.findall(r"^ *", target_line)
                    # if len(start_margin) != 0:
                    #     data_output = data_output + start_margin[0]
                    target_line_changed = re.split(
                        r"( *)(\d+\.\d+\%)", target_line)
                    for split_elem in target_line_changed:
                        if split_elem == '':
                            target_line_changed.remove(split_elem)
                    # print("target_rm_start: ",target_line_changed[remove_start],"after ",target_line_changed[remove_start-1])

                    # target_line_changed_str = "".join([target_line_changed[index] for index in range(len(
                    #     target_line_changed)) if not ((index >= remove_start) and (index < remove_end) and (all(index >= ignore_events[sub_index] for sub_index in range(len(ignore_events)) if sub_index %2 == 0)))])
                    target_line_changed_str_list = []
                    for index in range(len(target_line_changed)):
                        if remove_end >= len(target_line_changed):
                            sys.exit("remove_end size error")
                        found_first_step_rm = (
                            (index >= remove_start) and (index < remove_end))
                        if found_first_step_rm:
                            continue
                        if IGNORE_EXTRA:
                            if not found_first_step_rm:
                                bool_set = [(index >= ignore_events[sub_index]) and (
                                    index < ignore_events[sub_index+1]) for sub_index in range(len(ignore_events)) if sub_index % 2 == 0]
                                if True in bool_set:
                                    continue
                        """
                        here not take `ignore_events` in account.
                        """
                        if drop_child and index == remove_end:
                            target_line_changed_str_list.append(
                                target_line_changed[0]+target_line_changed[index].lstrip())
                        else:
                            target_line_changed_str_list.append(
                                target_line_changed[index])
                    target_line_changed_str = "".join(
                        target_line_changed_str_list)
                    if DEBUG_DICT["show_after_change"]:
                        print("after change: ", target_line_changed_str)
                    data_output = data_output+target_line_changed_str
        # print(data_output)
        file_2.write(data_output)


"""
recommend use `sample_num` to output minimum required info.
"""

if __name__ == "__main__":
    if len(sys.argv) == 1:
        sys.exit("need params, use `-h` to view usage")
    else:
        (INPUT_FILE, OUTPUT_FILE, REMOVE_START_PARENT, REMOVE_END_PARENT,
         REMOVE_START_CHILD_PARENT, REMOVE_END_CHILD_PARENT) = parse_arg(argv=sys.argv[1:])
        target_inc = 5
        check_str = "dgemm"
        if IGNORE_EXTRA:
            if "child" in OUTPUT_FILE:
                main(sys.argv[1:], remove_start=REMOVE_START_PARENT,
                     remove_end=REMOVE_END_PARENT, inputfile=INPUT_FILE, outputfile=OUTPUT_FILE, ignore_events=[0, 9], target_inc=target_inc, check_str=check_str, drop_child=False)
            elif "sample" in OUTPUT_FILE:
                main(sys.argv[1:], remove_start=REMOVE_START_CHILD_PARENT,
                     remove_end=REMOVE_END_CHILD_PARENT, inputfile=INPUT_FILE, outputfile=OUTPUT_FILE, ignore_events=[0, 9], target_inc=target_inc, check_str=check_str, drop_child=True)
        elif ONLY_KEEP_START_NUM:
            if "child_num" in OUTPUT_FILE:
                main(sys.argv[1:], remove_start=REMOVE_START_PARENT,
                     remove_end=REMOVE_END_PARENT, inputfile=INPUT_FILE, outputfile=OUTPUT_FILE, target_inc=target_inc, check_str=check_str, drop_child=False)
            elif "sample_num" in OUTPUT_FILE:
                main(sys.argv[1:], remove_start=REMOVE_START_CHILD_PARENT,
                     remove_end=REMOVE_END_CHILD_PARENT, inputfile=INPUT_FILE, outputfile=OUTPUT_FILE, target_inc=target_inc, check_str=check_str, drop_child=True)
        else:
            if "child" in OUTPUT_FILE:
                main(sys.argv[1:], remove_start=REMOVE_START_PARENT,
                     remove_end=REMOVE_END_PARENT, inputfile=INPUT_FILE, outputfile=OUTPUT_FILE, target_inc=target_inc, check_str=check_str, drop_child=False)
            elif "sample" in OUTPUT_FILE:
                main(sys.argv[1:], remove_start=REMOVE_START_CHILD_PARENT,
                     remove_end=REMOVE_END_CHILD_PARENT, inputfile=INPUT_FILE, outputfile=OUTPUT_FILE, target_inc=target_inc, check_str=check_str, drop_child=True)
