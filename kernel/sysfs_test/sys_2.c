/*===============================================================
*   Copyright (C) 2015 All rights reserved.
*
*   File  ��sys.c
*   Author��Gavin (gavinlu1990@gmail.com)
*   Date  ��2015-04-22
*   Remark������linux3.10
*
================================================================*/
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/cdev.h>
#include <linux/fs.h>
#include <asm/uaccess.h>
#include <asm/io.h>
#include <linux/device.h>
#include <linux/platform_device.h>

MODULE_LICENSE("GPL");

/* ��sys�ļ�������cat sys_test*/
static size_t sys_test_show(struct kobject *kobj, struct kobj_attribute
        *attr, char *buf)
{
}

/* д��sys�ļ�,����echo xxx > sys_test*/
static size_t sys_test_store(struct kobject *kobj, struct kobj_attribute
        *attr, char *buf, size_t count)
{
}

/* ���崴��sys�ļ������� */
static struct kobj_attribute sys_file_attribute =
    _ATTR(sys_test, 0775, sys_test_show, NULL);

static struct attribute *sys_test_attr[] = {
    &sys_file_attribute.attr,
    NULL,
};

/* ����һ��group */
static struct attribute_group sys_file_test_group = {
     .name = "sys_file_test",
     .attrs = sys_test_attr,
};

/* ���Խ����group�����һ�� */
static attribute_group *groups[] = {
     &sys_file_test_group,
     NULL,
};

/* device tree */
static struct of_device_id create_sys_dt_ids[] = {
    { .compatible = "gavin,create_sys_file_test", },
    {},
};

/* sys�ļ��ǻ��ڴ�������ʼ��ʱ�������� */
static struct platform_driver sys_test_driver = {
    .driver = {
        .name = "create_sys_test",
        .owner = THIS_MODULE,
        .group = groups,
        /* ���ݶ������Ϣ��device tree����ƥ�� */
        .of_match_table = of_match_ptr(create_sys_dt_ids),
    },
};

static int __init create_sys_file_init(void)
{
     platform_driver_register(&create_sys_file_drv);

     return 0;
}

static void _exit create_sys_file_exit(void)
{
     platform_driver_unregister(&create_sys_file_drv);
}

module_init(create_sys_file_init);
module_exit(create_sys_file_exit);
MODULE_AUTHOR("gavinlu1990@gmail.com");
MODULE_DESCRIPTION("create sys file");
