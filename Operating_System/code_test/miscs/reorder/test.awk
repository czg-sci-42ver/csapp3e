#! /bin/awk -f
BEGIN {
    pre_num=0
}
{
    # https://unix.stackexchange.com/a/643087/568529
    cur_num = $5
    if (cur_num < pre_num) {
        print "error" cur_num "<" pre_num
    }
    pre_num = $5
}