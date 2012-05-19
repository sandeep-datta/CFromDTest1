
mainc:     file format elf64-x86-64


Disassembly of section .init:

00000000004004f8 <_init>:
  4004f8:	48 83 ec 08          	sub    rsp,0x8
  4004fc:	e8 7b 00 00 00       	call   40057c <call_gmon_start>
  400501:	e8 0a 01 00 00       	call   400610 <frame_dummy>
  400506:	e8 45 02 00 00       	call   400750 <__do_global_ctors_aux>
  40050b:	48 83 c4 08          	add    rsp,0x8
  40050f:	c3                   	ret    

Disassembly of section .plt:

0000000000400510 <printf@plt-0x10>:
  400510:	ff 35 da 0a 20 00    	push   QWORD PTR [rip+0x200ada]        # 600ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400516:	ff 25 dc 0a 20 00    	jmp    QWORD PTR [rip+0x200adc]        # 600ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  40051c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400520 <printf@plt>:
  400520:	ff 25 da 0a 20 00    	jmp    QWORD PTR [rip+0x200ada]        # 601000 <_GLOBAL_OFFSET_TABLE_+0x18>
  400526:	68 00 00 00 00       	push   0x0
  40052b:	e9 e0 ff ff ff       	jmp    400510 <_init+0x18>

0000000000400530 <__libc_start_main@plt>:
  400530:	ff 25 d2 0a 20 00    	jmp    QWORD PTR [rip+0x200ad2]        # 601008 <_GLOBAL_OFFSET_TABLE_+0x20>
  400536:	68 01 00 00 00       	push   0x1
  40053b:	e9 d0 ff ff ff       	jmp    400510 <_init+0x18>

0000000000400540 <test@plt>:
  400540:	ff 25 ca 0a 20 00    	jmp    QWORD PTR [rip+0x200aca]        # 601010 <_GLOBAL_OFFSET_TABLE_+0x28>
  400546:	68 02 00 00 00       	push   0x2
  40054b:	e9 c0 ff ff ff       	jmp    400510 <_init+0x18>

Disassembly of section .text:

0000000000400550 <_start>:
  400550:	31 ed                	xor    ebp,ebp
  400552:	49 89 d1             	mov    r9,rdx
  400555:	5e                   	pop    rsi
  400556:	48 89 e2             	mov    rdx,rsp
  400559:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  40055d:	50                   	push   rax
  40055e:	54                   	push   rsp
  40055f:	49 c7 c0 40 07 40 00 	mov    r8,0x400740
  400566:	48 c7 c1 b0 06 40 00 	mov    rcx,0x4006b0
  40056d:	48 c7 c7 34 06 40 00 	mov    rdi,0x400634
  400574:	e8 b7 ff ff ff       	call   400530 <__libc_start_main@plt>
  400579:	f4                   	hlt    
  40057a:	90                   	nop
  40057b:	90                   	nop

000000000040057c <call_gmon_start>:
  40057c:	48 83 ec 08          	sub    rsp,0x8
  400580:	48 8b 05 59 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a59]        # 600fe0 <_DYNAMIC+0x1a0>
  400587:	48 85 c0             	test   rax,rax
  40058a:	74 02                	je     40058e <call_gmon_start+0x12>
  40058c:	ff d0                	call   rax
  40058e:	48 83 c4 08          	add    rsp,0x8
  400592:	c3                   	ret    
  400593:	90                   	nop
  400594:	90                   	nop
  400595:	90                   	nop
  400596:	90                   	nop
  400597:	90                   	nop
  400598:	90                   	nop
  400599:	90                   	nop
  40059a:	90                   	nop
  40059b:	90                   	nop
  40059c:	90                   	nop
  40059d:	90                   	nop
  40059e:	90                   	nop
  40059f:	90                   	nop

00000000004005a0 <__do_global_dtors_aux>:
  4005a0:	55                   	push   rbp
  4005a1:	48 89 e5             	mov    rbp,rsp
  4005a4:	53                   	push   rbx
  4005a5:	48 83 ec 08          	sub    rsp,0x8
  4005a9:	80 3d 78 0a 20 00 00 	cmp    BYTE PTR [rip+0x200a78],0x0        # 601028 <__bss_start>
  4005b0:	75 4b                	jne    4005fd <__do_global_dtors_aux+0x5d>
  4005b2:	bb 30 0e 60 00       	mov    ebx,0x600e30
  4005b7:	48 8b 05 72 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a72]        # 601030 <dtor_idx.6559>
  4005be:	48 81 eb 28 0e 60 00 	sub    rbx,0x600e28
  4005c5:	48 c1 fb 03          	sar    rbx,0x3
  4005c9:	48 83 eb 01          	sub    rbx,0x1
  4005cd:	48 39 d8             	cmp    rax,rbx
  4005d0:	73 24                	jae    4005f6 <__do_global_dtors_aux+0x56>
  4005d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4005d8:	48 83 c0 01          	add    rax,0x1
  4005dc:	48 89 05 4d 0a 20 00 	mov    QWORD PTR [rip+0x200a4d],rax        # 601030 <dtor_idx.6559>
  4005e3:	ff 14 c5 28 0e 60 00 	call   QWORD PTR [rax*8+0x600e28]
  4005ea:	48 8b 05 3f 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a3f]        # 601030 <dtor_idx.6559>
  4005f1:	48 39 d8             	cmp    rax,rbx
  4005f4:	72 e2                	jb     4005d8 <__do_global_dtors_aux+0x38>
  4005f6:	c6 05 2b 0a 20 00 01 	mov    BYTE PTR [rip+0x200a2b],0x1        # 601028 <__bss_start>
  4005fd:	48 83 c4 08          	add    rsp,0x8
  400601:	5b                   	pop    rbx
  400602:	c9                   	leave  
  400603:	c3                   	ret    
  400604:	66 66 66 2e 0f 1f 84 	data32 data32 nop WORD PTR cs:[rax+rax*1+0x0]
  40060b:	00 00 00 00 00 

0000000000400610 <frame_dummy>:
  400610:	48 83 3d 20 08 20 00 	cmp    QWORD PTR [rip+0x200820],0x0        # 600e38 <__JCR_END__>
  400617:	00 
  400618:	55                   	push   rbp
  400619:	48 89 e5             	mov    rbp,rsp
  40061c:	74 12                	je     400630 <frame_dummy+0x20>
  40061e:	b8 00 00 00 00       	mov    eax,0x0
  400623:	48 85 c0             	test   rax,rax
  400626:	74 08                	je     400630 <frame_dummy+0x20>
  400628:	bf 38 0e 60 00       	mov    edi,0x600e38
  40062d:	c9                   	leave  
  40062e:	ff e0                	jmp    rax
  400630:	c9                   	leave  
  400631:	c3                   	ret    
  400632:	90                   	nop
  400633:	90                   	nop

0000000000400634 <main>:
  400634:	55                   	push   rbp
  400635:	48 89 e5             	mov    rbp,rsp
  400638:	48 83 ec 30          	sub    rsp,0x30
  40063c:	c7 45 f0 ef be ad de 	mov    DWORD PTR [rbp-0x10],0xdeadbeef
  400643:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  40064a:	c7 45 fc 64 00 00 00 	mov    DWORD PTR [rbp-0x4],0x64
  400651:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  400654:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  400658:	89 d6                	mov    esi,edx
  40065a:	48 89 c7             	mov    rdi,rax
  40065d:	e8 de fe ff ff       	call   400540 <test@plt>
  400662:	48 89 c1             	mov    rcx,rax
  400665:	89 d0                	mov    eax,edx
  400667:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  40066b:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  40066e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  400672:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  400676:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  40067a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40067e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  400681:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  400685:	b8 9c 07 40 00       	mov    eax,0x40079c
  40068a:	48 89 ce             	mov    rsi,rcx
  40068d:	48 89 c7             	mov    rdi,rax
  400690:	b8 00 00 00 00       	mov    eax,0x0
  400695:	e8 86 fe ff ff       	call   400520 <printf@plt>
  40069a:	b8 00 00 00 00       	mov    eax,0x0
  40069f:	c9                   	leave  
  4006a0:	c3                   	ret    
  4006a1:	90                   	nop
  4006a2:	90                   	nop
  4006a3:	90                   	nop
  4006a4:	90                   	nop
  4006a5:	90                   	nop
  4006a6:	90                   	nop
  4006a7:	90                   	nop
  4006a8:	90                   	nop
  4006a9:	90                   	nop
  4006aa:	90                   	nop
  4006ab:	90                   	nop
  4006ac:	90                   	nop
  4006ad:	90                   	nop
  4006ae:	90                   	nop
  4006af:	90                   	nop

00000000004006b0 <__libc_csu_init>:
  4006b0:	48 89 6c 24 d8       	mov    QWORD PTR [rsp-0x28],rbp
  4006b5:	4c 89 64 24 e0       	mov    QWORD PTR [rsp-0x20],r12
  4006ba:	48 8d 2d 53 07 20 00 	lea    rbp,[rip+0x200753]        # 600e14 <__init_array_end>
  4006c1:	4c 8d 25 4c 07 20 00 	lea    r12,[rip+0x20074c]        # 600e14 <__init_array_end>
  4006c8:	4c 89 6c 24 e8       	mov    QWORD PTR [rsp-0x18],r13
  4006cd:	4c 89 74 24 f0       	mov    QWORD PTR [rsp-0x10],r14
  4006d2:	4c 89 7c 24 f8       	mov    QWORD PTR [rsp-0x8],r15
  4006d7:	48 89 5c 24 d0       	mov    QWORD PTR [rsp-0x30],rbx
  4006dc:	48 83 ec 38          	sub    rsp,0x38
  4006e0:	4c 29 e5             	sub    rbp,r12
  4006e3:	41 89 fd             	mov    r13d,edi
  4006e6:	49 89 f6             	mov    r14,rsi
  4006e9:	48 c1 fd 03          	sar    rbp,0x3
  4006ed:	49 89 d7             	mov    r15,rdx
  4006f0:	e8 03 fe ff ff       	call   4004f8 <_init>
  4006f5:	48 85 ed             	test   rbp,rbp
  4006f8:	74 1c                	je     400716 <__libc_csu_init+0x66>
  4006fa:	31 db                	xor    ebx,ebx
  4006fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400700:	4c 89 fa             	mov    rdx,r15
  400703:	4c 89 f6             	mov    rsi,r14
  400706:	44 89 ef             	mov    edi,r13d
  400709:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  40070d:	48 83 c3 01          	add    rbx,0x1
  400711:	48 39 eb             	cmp    rbx,rbp
  400714:	72 ea                	jb     400700 <__libc_csu_init+0x50>
  400716:	48 8b 5c 24 08       	mov    rbx,QWORD PTR [rsp+0x8]
  40071b:	48 8b 6c 24 10       	mov    rbp,QWORD PTR [rsp+0x10]
  400720:	4c 8b 64 24 18       	mov    r12,QWORD PTR [rsp+0x18]
  400725:	4c 8b 6c 24 20       	mov    r13,QWORD PTR [rsp+0x20]
  40072a:	4c 8b 74 24 28       	mov    r14,QWORD PTR [rsp+0x28]
  40072f:	4c 8b 7c 24 30       	mov    r15,QWORD PTR [rsp+0x30]
  400734:	48 83 c4 38          	add    rsp,0x38
  400738:	c3                   	ret    
  400739:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000400740 <__libc_csu_fini>:
  400740:	f3 c3                	repz ret 
  400742:	90                   	nop
  400743:	90                   	nop
  400744:	90                   	nop
  400745:	90                   	nop
  400746:	90                   	nop
  400747:	90                   	nop
  400748:	90                   	nop
  400749:	90                   	nop
  40074a:	90                   	nop
  40074b:	90                   	nop
  40074c:	90                   	nop
  40074d:	90                   	nop
  40074e:	90                   	nop
  40074f:	90                   	nop

0000000000400750 <__do_global_ctors_aux>:
  400750:	55                   	push   rbp
  400751:	48 89 e5             	mov    rbp,rsp
  400754:	53                   	push   rbx
  400755:	48 83 ec 08          	sub    rsp,0x8
  400759:	48 8b 05 b8 06 20 00 	mov    rax,QWORD PTR [rip+0x2006b8]        # 600e18 <__CTOR_LIST__>
  400760:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  400764:	74 19                	je     40077f <__do_global_ctors_aux+0x2f>
  400766:	bb 18 0e 60 00       	mov    ebx,0x600e18
  40076b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400770:	48 83 eb 08          	sub    rbx,0x8
  400774:	ff d0                	call   rax
  400776:	48 8b 03             	mov    rax,QWORD PTR [rbx]
  400779:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  40077d:	75 f1                	jne    400770 <__do_global_ctors_aux+0x20>
  40077f:	48 83 c4 08          	add    rsp,0x8
  400783:	5b                   	pop    rbx
  400784:	c9                   	leave  
  400785:	c3                   	ret    
  400786:	90                   	nop
  400787:	90                   	nop

Disassembly of section .fini:

0000000000400788 <_fini>:
  400788:	48 83 ec 08          	sub    rsp,0x8
  40078c:	e8 0f fe ff ff       	call   4005a0 <__do_global_dtors_aux>
  400791:	48 83 c4 08          	add    rsp,0x8
  400795:	c3                   	ret    
