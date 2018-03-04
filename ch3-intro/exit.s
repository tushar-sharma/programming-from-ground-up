#PURPOSE: Simple program that exits and return
#         a status code to Linux kernel
#
#INPUT: None
#
#Output: return  a status code which can be viewed by
#        typing: echo $?
#
#VARIABLES:
# %eax holds the system call number
# %ebx holds the return status
.section .data

.section .text

.globl _start

_start:

movl $1, %eax      # linux kernel command for exiting a program

movl $0, %ebx      # return status


int $0x80          # wakes up the kernel to run the command
