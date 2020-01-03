//hello.c�ļ�
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/fs.h>
 #include <linux/init.h>
 #include <asm/io.h>         //����iomap����iounmap����
 //#include <asm/uaccess.h>    //����copy_from_user����
 #include <linux/device.h>   //��������صĴ�����
  
  int init_hello_module(void)
  {
     printk("***************Start***************\n");
     printk("Hello World Init! \n");
      return 0;
  }
  
  void exit_hello_module(void)
  {
     printk("***************End***************\n");
     printk("Hello World Exit! \n");
  }

 module_init(init_hello_module);
 module_exit(exit_hello_module);
 
 MODULE_LICENSE("Dual BSD/GPL");//һ��ŵ����
