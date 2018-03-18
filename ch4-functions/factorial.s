# PURPOSE : calculate factorial of a number
#         for example 3! = 3 * 2 * 1 or 6


.section .data

# this program has no global data

.section .text

.globl _start
.globl factorial


_start:

pushl $4

call factorial

addl $4, %esp

movl %eax, %ebx

movl $1, %eax
int $0x80

.type factorial, @function

factorial:

pushl %ebp

movl %esp , %ebp

movl 8(%ebp) , %eax   # move the first parament, 4(%ebp) is return address

cmpl $1, %eax
je end_factorial

decl %eax
push %eax
call factorial
movl 8(%ebp),  %ebx
imull %ebx, %eax

end_factorial:

movl %ebp, %esp
popl %ebp
ret
