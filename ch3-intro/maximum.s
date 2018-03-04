# PURPOSE: Find maximum number from a list of items
#
# VARIABLES: The register have the following uses
# %edi - holds the current positiion of itme being examined
# %ebx - largest data found
# %eax - current data
#
# data_item - contains the item data.
#             0 indicates termination of program

.section .data

    data_items:
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start

_start:

    movl $0, %edi    # 0th position
    movl data_items(,%edi, 4), %eax    # current item
    movl %eax, %ebx                   # both current & maximum are same

start_loop:
    cmpl $0, %eax
    je exit_loop
    # get new value of the list
    incl %edi
    movl data_items(, %edi, 4), %eax

    cmpl %ebx, %eax
    # if ebx is larger than eax
    jle start_loop

    # if ebx is smaller than eax
    movl %eax, %ebx
    jmp start_loop

exit_loop:
    movl $1, %eax
    int $0x80
