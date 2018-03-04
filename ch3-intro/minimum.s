# PURPOSE: Find a minimum number from a list of items
#
# VARIABLES: The register have the following uses
# %edi - holds the current positiion of itme being examined
# %ebx - smallest data found
# %eax - current data
#
# data_item - contains the item data.
#             0 indicates termination of program

.section .data

    data_items:
    .long 3,67,34,222,45,75,-5,34,44,33,22,11,66,0

.section .text
.globl _start

_start:

    movl $0, %edi
    movl data_items(, %edi, 4) , %eax
    movl %eax, %ebx     # first element is also the smallest

start_loop:
    cmpl $0, %eax
    je exit_loop

    # get the next element
    incl %edi
    movl data_items(, %edi, 4) , %eax
    # if ebx is less than equal to eax
    cmpl %eax, %ebx
    jle start_loop

    movl %eax, %ebx
    jmp start_loop

exit_loop:
    movl $1, %eax
    int $0x80
