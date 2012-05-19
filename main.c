#include "stdio.h"
#include "test.h"

//From x86_64 System V EABI Spec...
//rdi - 1st arg
//rsi - 2nd arg
//rdx - 3rd arg or 2nd return reg
//rcx - 4th arg
//r8  - 5th arg
//r9  - 6th arg
//rax - 1st return reg


// 0000000000400634 <main>:
//   400634:    55                      push   rbp
//   400635:    48 89 e5                mov    rbp,rsp
//   400638:    48 83 ec 30             sub    rsp,0x30                         //end of function prologue
//   40063c:    c7 45 f0 ef be ad de    mov    DWORD PTR [rbp-0x10],0xdeadbeef  //*(rbp-0x10) = p1 = 0xdeadbeef
//   400643:    c7 45 f4 00 00 00 00    mov    DWORD PTR [rbp-0xc],0x0          //*(rbp-0xc) = 0
//   40064a:    c7 45 fc 64 00 00 00    mov    DWORD PTR [rbp-0x4],0x64         //*(rbp-0x4) = p2 = 0x64
//   400651:    8b 55 fc                mov    edx,DWORD PTR [rbp-0x4]          //edx = p2
//   400654:    48 8b 45 f0             mov    rax,QWORD PTR [rbp-0x10]         //rax = p1
//   400658:    89 d6                   mov    esi,edx                          //esi = edx = p2
//   40065a:    48 89 c7                mov    rdi,rax                          //rdi = rax = p1
//   40065d:    e8 de fe ff ff          call   400540 <test@plt>                //test(rdi = p1, rsi = esi = p2) //Where is the retptr?
//   400662:    48 89 c1                mov    rcx,rax                          //rcx = rax
//   400665:    89 d0                   mov    eax,edx                          //eax = edx
//   400667:    48 89 4d d0             mov    QWORD PTR [rbp-0x30],rcx         //*(rbp-0x30) = rcx
//   40066b:    89 45 d8                mov    DWORD PTR [rbp-0x28],eax         //*(rbp-0x28) = eax
//   40066e:    48 8b 45 d0             mov    rax,QWORD PTR [rbp-0x30]         //rax = *(rbp-0x30)
//   400672:    48 89 45 e0             mov    QWORD PTR [rbp-0x20],rax         //*(rbp-0x20) = rax
//   400676:    48 8b 45 d8             mov    rax,QWORD PTR [rbp-0x28]         //rax = *(rbp-0x28)
//   40067a:    48 89 45 e8             mov    QWORD PTR [rbp-0x18],rax         //*(rbp-0x18) = rax
//   40067e:    8b 55 e8                mov    edx,DWORD PTR [rbp-0x18]         //edx = *(rbp-0x18)
//   400681:    48 8b 4d e0             mov    rcx,QWORD PTR [rbp-0x20]         //rcx = *(rbp-0x20)
//   400685:    b8 9c 07 40 00          mov    eax,0x40079c                     //eax = 0x40079c
//   40068a:    48 89 ce                mov    rsi,rcx                          //rsi = rcx
//   40068d:    48 89 c7                mov    rdi,rax                          //rdi = rax
//   400690:    b8 00 00 00 00          mov    eax,0x0                          //eax = 0
//   400695:    e8 86 fe ff ff          call   400520 <printf@plt>              //printf(fmt, ts.data, ts.flags)
//   40069a:    b8 00 00 00 00          mov    eax,0x0                          //eax = 0 //return 0;
//   40069f:    c9                      leave                                   //
//   4006a0:    c3                      ret                                     //

int main()
{
    void *p1 = (void*)0xDEADBEEF;
    unsigned p2 = 100; //0x64

    TestStruct ts = test(p1, p2);

    printf("ts.data=%p\nts.flags=%u\n", ts.data, ts.flags);
    return 0;
}