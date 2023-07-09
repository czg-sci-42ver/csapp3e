#! /home/czg/.virtualenv/misc/bin/python
import sys
import argparse
import os
import pathlib
import re
from perf_report_post import miscs as miscs
import matplotlib.pyplot as plt

"""
the following works to input file like:
1:
func dgemm_unrolled_avx256: 940, 490, 1.91837
func dgemm_blocked_avx256: 1072, 541, 1.98152
func dgemm_openmp_256: 1141, 705, 1.61844
# repeat the above similarly


"""

class data_check:
    @staticmethod
    def check_zero(func_str:str,find_cnt:dict):
        for index,data in enumerate(find_cnt[func_str]['datas']):
            if data == 0:
                # miscs.print_err('weird data zero at '+str(index)+"th of "+str(func_str))
                miscs.print_err('weird data zero at ',index,"th of ",func_str)

if __name__ == "__main__":
    if len(sys.argv) == 1:
        sys.exit("need params, use `-h` to view usage")
    else:
        cur_script_file = os.path.relpath(__file__, os.getcwd())
        parser = argparse.ArgumentParser(
                    prog=cur_script_file,
                    description='compare rates',
                    epilog='Just run this: to use this script. If failed, change shebang in python script to your interpreter')
        parser.add_argument('-o',dest='outputs',type=str,nargs=2,)
        parser.add_argument('-i',dest='input',type=str,nargs=1,)
        parser.add_argument('-l','--list',dest='func_list',type=str,nargs=1,help='func list to be calculated')
        args = parser.parse_args()
        func_list = args.func_list[0].split(',')
        """
        miscs initial
        """
        image_output,log_output=['','']
        find_cnt = {}
        contents_output = ''
        block_denominator_list = []
        start_num = [0]
        start_num_before = start_num
        newline_symbol = '\n'

        input_file_str = args.input[0]
        use_pygal = False
        for output in args.outputs:
            if 'png' in output:
                image_output = output
            elif 'svg' in output:
                image_output = output
                use_pygal=True
            elif "log" in output:
                log_output = output
            else:
                exit("output file suffix error")
        print(args.outputs,)
        find_cnt = {}
        for func_str in func_list:
            find_cnt[func_str] = {}
            find_cnt[func_str]['cnt']=0
            find_cnt[func_str]['datas'] = []
        with open(input_file_str,'r') as input_file:
            lines = input_file.readlines()
            for target_line_index in range(len(lines)):
                target_line = lines[target_line_index]
                target_line_list = target_line.split(' ')
                for func_str in func_list:
                    find_func = False
                    """
                    count to update `block_denominator_list` and then skip lines without func_str
                    """
                    if len(re.findall(func_str,target_line)) != 0:
                        find_cnt[func_str]['cnt']+=1
                        find_func = True
                    else:
                        start_num_before = start_num
                        start_num = re.findall(r"^\d+",target_line)
                        if len(start_num)!=0 and start_num_before!=start_num:
                            print("find start_num: ",target_line)
                            block_denominator_list.append(float(start_num[0]))
                            contents_output += newline_symbol+target_line
                        continue
                    if find_func:
                        if find_cnt[func_str]['cnt']==1:
                            try:
                                base_data = float(target_line_list[-1])
                            except ValueError:
                                sys.exit(''.join(target_line_list)+"\n with "+target_line_list[-1]+" is error")
                            find_cnt[func_str]['base'] = base_data
                            find_cnt[func_str]['datas'].append(1)
                            print(func_str,"'s base: ",find_cnt[func_str]['base'])
                            contents_output += func_str+": "+"1 ("+str(base_data)+")"+newline_symbol
                        else:
                            try:
                                data = float(target_line_list[-1])
                            except ValueError:
                                sys.exit(''.join(target_line_list)+"\n with "+target_line_list[-1]+" is error")
                            compare_data = data/find_cnt[func_str]['base']
                            if compare_data == 0:
                                miscs.print_err(data,"/",find_cnt[func_str]['base']," is 0 with ",func_str)
                            find_cnt[func_str]['datas'].append(compare_data)
                            contents_output += func_str+": "+str(compare_data)+" ("+str(data)+")"+newline_symbol
        if image_output != '':
            """
            https://stackoverflow.com/questions/25938015/how-to-make-pygal-distribute-legend-into-n-columns-or-truncate-correctly
            https://www.pygal.org/en/latest/documentation/types/line.html
            """
            if use_pygal:
                import pygal
                line_chart = pygal.Line(show_legend=True, human_readable=True,legend_at_bottom = True,x_title='denominator_list',y_title='data/base')
                line_chart.title = 'Comparison'
                line_chart.x_labels = list(map(str, block_denominator_list))
                for func_str in func_list:
                    data_check.check_zero(func_str=func_str,find_cnt=find_cnt)
                    line_chart.add(func_str,find_cnt[func_str]['datas'])
                line_chart.render_to_file(image_output)
            else:
                # fig, ax1 = plt.subplots(1, 1)
                x= block_denominator_list
                for func_str in func_list:
                    y= find_cnt[func_str]['datas']
                    plt.plot(x,y,label=func_str)
                plt.xlabel('denominators')
                plt.ylabel('data/base')
                plt.legend()
                plt.savefig(image_output)
        if log_output != '':
            with open(log_output,"w+") as file:
                file.write(contents_output)