//hello.c�ļ�
#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <asm/io.h>         //����iomap����iounmap����
//#include <asm/uaccess.h>    //����copy_from_user����
#include <linux/device.h>   //��������صĴ�����
 
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
MODULE_LICENSE("Dual BSD/GPL");//һ��ŵ����
MODULE_DESCRIPTION("test module param");
