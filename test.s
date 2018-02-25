extern printf

section .data
fizz:	db "Fizz", 0
buzz:	db "Buzz", 0
fmt_str: db "%s", 10, 0
fmt_int: db "%d", 10, 0

section .text

global main

print_str:
   push rbp
   mov rbp, rsp

   push rax
   push r8
   mov rax, 0
   mov rax, [rbp + 16]
   
   mov	rdi, fmt_str
   mov	rsi, rax
   mov	rax, 0
   call  printf

   pop r8
   pop rax
   pop rbp
   ret 8

print_int:
   push rbp
   mov rbp, rsp

   push rax
   push r8
   mov rax, 0
   mov rax, [rbp + 16]
   
   mov	rdi, fmt_int
   mov	rsi, rax
   mov	rax, 0
   call  printf

   pop r8
   pop rax
   pop rbp
   ret 8

print_rcx:
   push r8
   call print_int
   ret

print_fizz:
   push fizz
   call print_str
   ret
 
print_buzz:
   push buzz
   call  print_str
   ret
   
main:
   push rbp
   mov r8, 1

loop:
   cmp r8, 100
   je exit

   ;; Make a divison of rcx / 3
   mov rax, r8
   mov rdx, 0  ; to prevent errors exceptions
   mov rcx, 3
   div rcx
   mov r9, rdx

   ;; Make a divison of rcx / 5
   mov rax, r8
   mov rdx, 0  ; to prevent errors exceptions
   mov rcx, 5
   div rcx
   mov r10, rdx

   mov r11, 0
   add r11, r9
   add r11, r10
   
   cmp r11, 0
   je fizzbuzzcase
   
   cmp r9, 0
   je fizzcase

   cmp r10, 0
   je buzzcase

basecase:
   call print_rcx
   jmp endif

fizzbuzzcase:
   call print_fizz
   call print_buzz
   jmp endif

fizzcase: 
   call print_fizz
   jmp endif

buzzcase:  
   call print_buzz
   jmp endif

endif:   
   inc r8
   loop loop

exit:
   pop rbp
   mov rax, 0
   ret
