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

//ASM Code generated when a TestStruct is not created for the return value
// 00000000000005ac <test>:
//  5ac:	55                   	push   rbp
//  5ad:	48 89 e5             	mov    rbp,rsp
//  5b0:	41 54                	push   r12
//  5b2:	53                   	push   rbx 											
//  5b3:	48 83 ec 10          	sub    rsp,0x10										//rsp -= 0x10 //end of function prologue
//  5b7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi						//p1 = rdi
//  5bb:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi                     //p2 = esi
//  5be:	48 8d 05 81 00 00 00 	lea    rax,[rip+0x81]        # 646 <_fini+0xe>      //rax = rip + 0x81
//  5c5:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]						//rdx = p1
//  5c9:	48 89 d6             	mov    rsi,rdx                                      //rsi = rdx = p1
//  5cc:	48 89 c7             	mov    rdi,rax                                      //rdi = rax = rip + 0x81
//  5cf:	b8 00 00 00 00       	mov    eax,0x0                                      //eax = 0
//  5d4:	e8 e7 fe ff ff       	call   4c0 <printf@plt>                             //printf(fmt, p1)
//  5d9:	48 8d 05 6d 00 00 00 	lea    rax,[rip+0x6d]        # 64d <_fini+0x15>     //rax = rip + 0x6d
//  5e0:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]                     //edx = p2
//  5e3:	89 d6                	mov    esi,edx                                      //esi = edx = p2
//  5e5:	48 89 c7             	mov    rdi,rax										//rdi = rax
//  5e8:	b8 00 00 00 00       	mov    eax,0x0                                      //eax = 0
//  5ed:	e8 ce fe ff ff       	call   4c0 <printf@plt>                             //printf(fmt, p2)
//  5f2:	4c 89 e0             	mov    rax,r12                                      //rax = r12 = t.data  //returning garbage?
//  5f5:	89 da                	mov    edx,ebx                                      //edx = ebx = t.flags //ditto
//  5f7:	48 83 c4 10          	add    rsp,0x10                                     //rsp += 0x10 //start of epilog
//  5fb:	5b                   	pop    rbx
//  5fc:	41 5c                	pop    r12
//  5fe:	c9                   	leave  
//  5ff:	c3                   	ret

//ASM Code generated when a local TestStruct is created for the return value
// 00000000000005ac <test>:
//  5ac:	55                   	push   rbp
//  5ad:	48 89 e5             	mov    rbp,rsp
//  5b0:	48 83 ec 40          	sub    rsp,0x40										//rsp -= 0x40 //end of function prologue
//  5b4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
//  5b8:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
//  5bb:	48 8d 05 a4 00 00 00 	lea    rax,[rip+0xa4]        # 666 <_fini+0xe>
//  5c2:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
//  5c6:	48 89 d6             	mov    rsi,rdx
//  5c9:	48 89 c7             	mov    rdi,rax
//  5cc:	b8 00 00 00 00       	mov    eax,0x0
//  5d1:	e8 ea fe ff ff       	call   4c0 <printf@plt>
//  5d6:	48 8d 05 90 00 00 00 	lea    rax,[rip+0x90]        # 66d <_fini+0x15>
//  5dd:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
//  5e0:	89 d6                	mov    esi,edx
//  5e2:	48 89 c7             	mov    rdi,rax
//  5e5:	b8 00 00 00 00       	mov    eax,0x0
//  5ea:	e8 d1 fe ff ff       	call   4c0 <printf@plt>
//  5ef:	c7 45 f0 0d d0 fe ca 	mov    DWORD PTR [rbp-0x10],0xcafed00d 				//t.data = 0xcafed00d
//  5f6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0 						//padding?
//  5fd:	c7 45 f8 e8 03 00 00 	mov    DWORD PTR [rbp-0x8],0x3e8 					//t.flags = 0x3e8
//  604:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]						//rax = t.data
//  608:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax						//*(rbp-0x20) = rax = t.data
//  60c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8] 						//rax = t.flags
//  610:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax 					//*(rbp-0x18) = rax = t.flags
//  614:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20] 					//rax = *(rbp-0x20) = t.data
//  618:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]						//edx = *(rbp-0x18) = t.flags
//  61b:	c9                   	leave  
//  61c:	c3                   	ret   


TestStruct test(void* p1, unsigned p2)
{
	printf("p1=%p\n", p1);
	printf("p2=%u\n", p2);

	TestStruct t = {(void*)0xCAFED00D, 1000 /*0x3e8*/};

	return t;
}