//hello.c文件
#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <asm/io.h>         //含有iomap函数iounmap函数
//#include <asm/uaccess.h>    //含有copy_from_user函数
#include <linux/device.h>   //含有类相关的处理函数
 
static char *book_name = "dissecting Linux Device Driver";
static int num = 4000;

int init_hello_module(void)
{
   printk(KERN_INFO "book name: %s\n", book_name);
   printk(KERN_INFO "book num: %d\n", num);
    return 0;
}

void exit_hello_module(void)
{
   printk("***************End***************\n");
   printk("Hello World Exit! \n");
}


int add_integer(int a, int b)
{
    return a+b;
}

module_init(init_hello_module);
module_exit(exit_hello_module);

module_param(num, int, S_IRUGO);
module_param(book_name, charp, S_IRUGO);

EXPORT_SYMBOL(add_integer);

MODULE_AUTHOR("ALLAN WANG");
MODULE_LICENSE("Dual BSD/GPL");//一般放到最后
MODULE_DESCRIPTION("test module param");
