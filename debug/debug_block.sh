############### not use `#...` inside the awk command !!!!

# at least in zsh, `ls ./////` function same as `ls ./`
#cd ~/matrix-matrix-multiply/build;cmake ..;make;\
# bash bool https://stackoverflow.com/questions/2953646/how-can-i-declare-and-use-boolean-variables-in-a-shell-script
#############
# not use RUN_MULTIPLE which will output too many dirs and files. 
# Just run whatever times you want with this script and see the `debug_quotient` output file.
#############
# bash is different from zsh not supporting ${BLOCK_DENOMINATOR_LIST} to get list ; https://stackoverflow.com/questions/52901012/what-is-a-list-in-bash.
###########
# select_column_str "numerator,denominator"
###########
dir=/mnt/ubuntu/home/czg/csapp3e;\
file=no_prefetch_l2_opcache;\
sub_dir=debug_block;\
quotient_dir=debug_quotient;\
OUTPUT_ANNOTATE=false;\
RUN_MULTIPLE=false;\
USE_BLOCK_DENOMINATOR_LIST=false;\
RUN_AWK=true;\
# func_list=dgemm_unrolled_avx256,dgemm_blocked_avx256,dgemm_openmp_256;\
func_list=dgemm_avx256,dgemm_basic,dgemm_basic_blocked,dgemm_unrolled_avx256,dgemm_blocked_avx256,dgemm_openmp_256;\
if [[ ${RUN_MULTIPLE} == true ]];then \
run_times=5;\
else run_times=1;fi;\
annotate_dir=${dir}/debug/debug_annotate;\
events=l2_cache_req_stat.ls_rd_blk_c\
,l2_request_g1.rd_blk_l,l2_request_g1.rd_blk_x\
,l2_request_g1.ls_rd_blk_c_s\
,l2_request_g1.cacheable_ic_read\
,l2_request_g1.l2_hw_pf\
;\
events_num=$(echo ${events} | awk -F "," "{print NF}" -);\
cd;\
if [[ "${USE_BLOCK_DENOMINATOR_LIST}" == true ]];\
then BLOCK_DENOMINATOR_LIST=(1 2 4 5 10 20 40);\
else BLOCK_DENOMINATOR_LIST=(10);\
fi;\
if [[ ! -d ~/perf_log/${sub_dir}/ ]];then echo "mkdir";mkdir ~/perf_log/${sub_dir}/;fi;\
if [[ -d ${dir}/debug/${sub_dir}/ ]];then rm -r ${dir}/debug/${sub_dir}/ && mkdir ${dir}/debug/${sub_dir}/ && echo "mkdir ${dir}/debug/${sub_dir}/";\
else mkdir ${dir}/debug/${sub_dir}/ && echo "mkdir ${dir}/debug/${sub_dir}/" ;fi;\
mkdir ${dir}/debug/${sub_dir}/${quotient_dir}/;\
if [[ "${OUTPUT_ANNOTATE}" == true ]];then \
rm -r ${annotate_dir}/;\
mkdir ${annotate_dir}/;\
fi;\
# touch ${dir}/debug/${sub_dir}/sample_num_${file}_${BLOCK_DENOMINATOR}_quotient.report;\
#else rm -r ${dir}/debug/${sub_dir}/;\
#fi;\
\
start_index=$((${events_num}-1));\
for ((index=0;index<${run_times};index++));do \
echo "list: " ${BLOCK_DENOMINATOR_LIST[@]};\
for BLOCK_DENOMINATOR in ${BLOCK_DENOMINATOR_LIST[@]};do \
perf record -g --call-graph fp -e ${events} \
~/matrix-matrix-multiply/build/${sub_dir}/dgemm_${BLOCK_DENOMINATOR};\
mv perf.data ~/perf_log/${sub_dir}/${file}_${BLOCK_DENOMINATOR}.log;\
if [[ "${OUTPUT_ANNOTATE}" == true ]];then \
perf annotate -M intel --stdio --stdio-color always --group -n \
-i ~/perf_log/${sub_dir}/${file}_${BLOCK_DENOMINATOR}.log >  ${annotate_dir}/${file}_${BLOCK_DENOMINATOR}_annotated.report;\
fi;\
perf report -i ~/perf_log/${sub_dir}/${file}_${BLOCK_DENOMINATOR}.log --group --stdio -n --hierarchy > ${dir}/debug/${sub_dir}/${file}_${BLOCK_DENOMINATOR}.report;\
python ${dir}/debug/perf_report_post.py -i ${dir}/debug/${sub_dir}/${file}_${BLOCK_DENOMINATOR}.report -o ${dir}/debug/${sub_dir}/sample_num_${file}_${BLOCK_DENOMINATOR}.report -n ${events_num};\
if [[ ${RUN_AWK} == true ]];then \
echo "awk ${dir}/debug/${sub_dir}/sample_num_${file}_${BLOCK_DENOMINATOR}.report";\
cp ${dir}/debug/dgemm_de_dis.awk ${dir}/debug/dgemm_de_dis.awk.bk;\
gawk -f ${dir}/debug/dgemm_de_dis.awk -o${dir}/debug/dgemm_de_dis_format.awk;\
mv ${dir}/debug/dgemm_de_dis_format.awk ${dir}/debug/dgemm_de_dis.awk;\
awk \
-v target_funcs="${func_list}" \
-v output="${dir}/debug/${sub_dir}/${quotient_dir}/sample_num_${file}_quotient.report" \
-v denominator="${BLOCK_DENOMINATOR}" \
-v select_column_str="2,3" \
-f ${dir}/debug/dgemm_de_dis.awk \
${dir}/debug/${sub_dir}/sample_num_${file}_${BLOCK_DENOMINATOR}.report\
;echo "current BLOCK_DENOMINATOR: " ${BLOCK_DENOMINATOR}\
;fi \
;done \
;if [[ ${RUN_AWK} == true ]];then \
;echo "finish the nest loop"\
;cd ${dir}/debug/${sub_dir}/${quotient_dir}/\
;${dir}/debug/compare_rate_draw.py \
-i sample_num_${file}_quotient.report \
-o ../../${file}.svg ${file}.log \
-l "dgemm_blocked_avx256,dgemm_openmp_256" \
;fi \
;done
