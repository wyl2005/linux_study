#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/cdev.h>
#include <linux/fs.h>
#include <asm/uaccess.h>
#include <asm/io.h>
#include <linux/device.h>
#include <linux/platform_device.h>
#include <linux/sysfs.h>

MODULE_LICENSE("GPL");

static struct kobject *sys_kobj;

/* 读sys文件，例如cat sys_test */
static size_t sys_test_show(struct kobject *kobj, struct kobj_attribute *attr,
        char *buf)
{
    return snprintf(buf, 10, "%s", "1234567890\n");
}

/* 写入sys文件,例如echo xxx sys_test*/
static size_t sys_test_store(struct kobject *kobj, struct kobj_attribute
        *attr, const char *buf, size_t count)
{
    return 0;
}

/* 定义创建sys文件的属性 */
static struct kobj_attribute sys_file_attribute =
    __ATTR(sys_test, 0775, sys_test_show, sys_test_store);

static struct attribute *sys_test_attr[] = {
    &sys_file_attribute.attr,
    NULL,
};

/* 定义一个group */
static struct attribute_group sys_file_test_group = {
     .name = "sys_file_test",
     .attrs = sys_test_attr,
};


/* /fs/sysfs/group.c */
static int __init create_sys_file_init(void)
{
    int ret;
    sys_kobj = kobject_create_and_add("sys_test_group", NULL);
    ret = sysfs_create_group(sys_kobj, &sys_file_test_group);
    if(ret) {
        printk(KERN_ERR "sysfs_create_group error\n");
        return -1;
    }
    printk(KERN_ERR "sysfs_create_group ok\n");
//    sysfs_remove_group(sys_kobj, &sys_file_test_group);
//    printk( KERN_ERR "sysfs_remove_group\n");

    return 0;
}

static void  __exit create_sys_file_exit(void)
{
    sysfs_remove_group(sys_kobj, &sys_file_test_group);
    printk( KERN_ERR "sysfs_remove_group\n");
}

module_init(create_sys_file_init);
module_exit(create_sys_file_exit);
MODULE_AUTHOR("gavinlu1990@gmail.com");
MODULE_DESCRIPTION("create sys file");
