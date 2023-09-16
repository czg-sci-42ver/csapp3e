#! /bin/awk -f
BEGIN {
    pre_num=0
}
{
    cur_num = $5
    if (cur_num < pre_num) {
        print "error" cur_num "<" pre_num
    }
    pre_num = $5
}