#include <thread>
#include <atomic>
#include <cassert>
#include <stdio.h>
 
std::atomic<bool> x = {false};
std::atomic<bool> y = {false};
std::atomic<int> z = {0};
 
void write_x()
{
    x.store(true, std::memory_order_seq_cst);
}
 
void write_y()
{
    y.store(true, std::memory_order_seq_cst);
}
 
void read_x_then_y()
{
    // while (!x.load(std::memory_order_seq_cst))
    //     ;
    printf("x: %d y:%d\n",x.load(std::memory_order_seq_cst),y.load(std::memory_order_seq_cst));
    if (y.load(std::memory_order_seq_cst)) {
        printf("in x_y: ++z\n");
        ++z;
    }
}
 
void read_y_then_x()
{
    // while (!y.load(std::memory_order_seq_cst))
    //     ;
    printf("y: %d x:%d\n",y.load(std::memory_order_seq_cst),x.load(std::memory_order_seq_cst));
    if (x.load(std::memory_order_seq_cst)) {
        printf("in y_x: ++z\n");
        ++z;
    }
}
 
int main()
{
    std::thread c(read_x_then_y);
    std::thread d(read_y_then_x);
    std::thread a(write_x);
    std::thread b(write_y);
    a.join(); b.join(); c.join(); d.join();
    /*
    here order between load and store has no ensure.
    So must use while in all cppreference codes related with release,etc.
    */
    assert(z.load() != 0); 
    printf("%d\n",z.load());
}
