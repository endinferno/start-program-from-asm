.section .text
.global self_start

self_start:
    mov (%rsp), %rdi
    lea 8(%rsp), %rsi

    call _entry

    # 调用_exit系统调用以退出程序
    mov $60, %rax            # 系统调用号 (sys_exit)
    xor %rdi, %rdi           # 返回码 0
    syscall                  # 调用内核
