
libtest.so:     file format elf64-x86-64


Disassembly of section .init:

0000000000000498 <_init>:
 498:	48 83 ec 08          	sub    rsp,0x8
 49c:	e8 3f 00 00 00       	call   4e0 <call_gmon_start>
 4a1:	e8 da 00 00 00       	call   580 <frame_dummy>
 4a6:	e8 75 01 00 00       	call   620 <__do_global_ctors_aux>
 4ab:	48 83 c4 08          	add    rsp,0x8
 4af:	c3                   	ret    

Disassembly of section .plt:

00000000000004b0 <printf@plt-0x10>:
 4b0:	ff 35 3a 0b 20 00    	push   QWORD PTR [rip+0x200b3a]        # 200ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
 4b6:	ff 25 3c 0b 20 00    	jmp    QWORD PTR [rip+0x200b3c]        # 200ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
 4bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000004c0 <printf@plt>:
 4c0:	ff 25 3a 0b 20 00    	jmp    QWORD PTR [rip+0x200b3a]        # 201000 <_GLOBAL_OFFSET_TABLE_+0x18>
 4c6:	68 00 00 00 00       	push   0x0
 4cb:	e9 e0 ff ff ff       	jmp    4b0 <_init+0x18>

00000000000004d0 <__cxa_finalize@plt>:
 4d0:	ff 25 32 0b 20 00    	jmp    QWORD PTR [rip+0x200b32]        # 201008 <_GLOBAL_OFFSET_TABLE_+0x20>
 4d6:	68 01 00 00 00       	push   0x1
 4db:	e9 d0 ff ff ff       	jmp    4b0 <_init+0x18>

Disassembly of section .text:

00000000000004e0 <call_gmon_start>:
 4e0:	48 83 ec 08          	sub    rsp,0x8
 4e4:	48 8b 05 e5 0a 20 00 	mov    rax,QWORD PTR [rip+0x200ae5]        # 200fd0 <_DYNAMIC+0x180>
 4eb:	48 85 c0             	test   rax,rax
 4ee:	74 02                	je     4f2 <call_gmon_start+0x12>
 4f0:	ff d0                	call   rax
 4f2:	48 83 c4 08          	add    rsp,0x8
 4f6:	c3                   	ret    
 4f7:	90                   	nop
 4f8:	90                   	nop
 4f9:	90                   	nop
 4fa:	90                   	nop
 4fb:	90                   	nop
 4fc:	90                   	nop
 4fd:	90                   	nop
 4fe:	90                   	nop
 4ff:	90                   	nop

0000000000000500 <__do_global_dtors_aux>:
 500:	55                   	push   rbp
 501:	80 3d 10 0b 20 00 00 	cmp    BYTE PTR [rip+0x200b10],0x0        # 201018 <__bss_start>
 508:	48 89 e5             	mov    rbp,rsp
 50b:	41 54                	push   r12
 50d:	53                   	push   rbx
 50e:	75 62                	jne    572 <__do_global_dtors_aux+0x72>
 510:	48 83 3d c8 0a 20 00 	cmp    QWORD PTR [rip+0x200ac8],0x0        # 200fe0 <_DYNAMIC+0x190>
 517:	00 
 518:	74 0c                	je     526 <__do_global_dtors_aux+0x26>
 51a:	48 8b 3d ef 0a 20 00 	mov    rdi,QWORD PTR [rip+0x200aef]        # 201010 <__dso_handle>
 521:	e8 aa ff ff ff       	call   4d0 <__cxa_finalize@plt>
 526:	48 8d 1d 13 09 20 00 	lea    rbx,[rip+0x200913]        # 200e40 <__DTOR_END__>
 52d:	4c 8d 25 04 09 20 00 	lea    r12,[rip+0x200904]        # 200e38 <__DTOR_LIST__>
 534:	48 8b 05 e5 0a 20 00 	mov    rax,QWORD PTR [rip+0x200ae5]        # 201020 <dtor_idx.6559>
 53b:	4c 29 e3             	sub    rbx,r12
 53e:	48 c1 fb 03          	sar    rbx,0x3
 542:	48 83 eb 01          	sub    rbx,0x1
 546:	48 39 d8             	cmp    rax,rbx
 549:	73 20                	jae    56b <__do_global_dtors_aux+0x6b>
 54b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
 550:	48 83 c0 01          	add    rax,0x1
 554:	48 89 05 c5 0a 20 00 	mov    QWORD PTR [rip+0x200ac5],rax        # 201020 <dtor_idx.6559>
 55b:	41 ff 14 c4          	call   QWORD PTR [r12+rax*8]
 55f:	48 8b 05 ba 0a 20 00 	mov    rax,QWORD PTR [rip+0x200aba]        # 201020 <dtor_idx.6559>
 566:	48 39 d8             	cmp    rax,rbx
 569:	72 e5                	jb     550 <__do_global_dtors_aux+0x50>
 56b:	c6 05 a6 0a 20 00 01 	mov    BYTE PTR [rip+0x200aa6],0x1        # 201018 <__bss_start>
 572:	5b                   	pop    rbx
 573:	41 5c                	pop    r12
 575:	c9                   	leave  
 576:	c3                   	ret    
 577:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
 57e:	00 00 

0000000000000580 <frame_dummy>:
 580:	48 83 3d c0 08 20 00 	cmp    QWORD PTR [rip+0x2008c0],0x0        # 200e48 <__JCR_END__>
 587:	00 
 588:	55                   	push   rbp
 589:	48 89 e5             	mov    rbp,rsp
 58c:	74 1a                	je     5a8 <frame_dummy+0x28>
 58e:	48 8b 05 43 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a43]        # 200fd8 <_DYNAMIC+0x188>
 595:	48 85 c0             	test   rax,rax
 598:	74 0e                	je     5a8 <frame_dummy+0x28>
 59a:	48 8d 3d a7 08 20 00 	lea    rdi,[rip+0x2008a7]        # 200e48 <__JCR_END__>
 5a1:	c9                   	leave  
 5a2:	ff e0                	jmp    rax
 5a4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
 5a8:	c9                   	leave  
 5a9:	c3                   	ret    
 5aa:	90                   	nop
 5ab:	90                   	nop

00000000000005ac <test>:
 5ac:	55                   	push   rbp
 5ad:	48 89 e5             	mov    rbp,rsp
 5b0:	48 83 ec 40          	sub    rsp,0x40
 5b4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
 5b8:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
 5bb:	48 8d 05 a4 00 00 00 	lea    rax,[rip+0xa4]        # 666 <_fini+0xe>
 5c2:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
 5c6:	48 89 d6             	mov    rsi,rdx
 5c9:	48 89 c7             	mov    rdi,rax
 5cc:	b8 00 00 00 00       	mov    eax,0x0
 5d1:	e8 ea fe ff ff       	call   4c0 <printf@plt>
 5d6:	48 8d 05 90 00 00 00 	lea    rax,[rip+0x90]        # 66d <_fini+0x15>
 5dd:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
 5e0:	89 d6                	mov    esi,edx
 5e2:	48 89 c7             	mov    rdi,rax
 5e5:	b8 00 00 00 00       	mov    eax,0x0
 5ea:	e8 d1 fe ff ff       	call   4c0 <printf@plt>
 5ef:	c7 45 f0 0d d0 fe ca 	mov    DWORD PTR [rbp-0x10],0xcafed00d
 5f6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
 5fd:	c7 45 f8 e8 03 00 00 	mov    DWORD PTR [rbp-0x8],0x3e8
 604:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
 608:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
 60c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
 610:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 614:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
 618:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
 61b:	c9                   	leave  
 61c:	c3                   	ret    
 61d:	90                   	nop
 61e:	90                   	nop
 61f:	90                   	nop

0000000000000620 <__do_global_ctors_aux>:
 620:	55                   	push   rbp
 621:	48 89 e5             	mov    rbp,rsp
 624:	53                   	push   rbx
 625:	48 83 ec 08          	sub    rsp,0x8
 629:	48 8b 05 f8 07 20 00 	mov    rax,QWORD PTR [rip+0x2007f8]        # 200e28 <__CTOR_LIST__>
 630:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
 634:	74 19                	je     64f <__do_global_ctors_aux+0x2f>
 636:	48 8d 1d eb 07 20 00 	lea    rbx,[rip+0x2007eb]        # 200e28 <__CTOR_LIST__>
 63d:	0f 1f 00             	nop    DWORD PTR [rax]
 640:	48 83 eb 08          	sub    rbx,0x8
 644:	ff d0                	call   rax
 646:	48 8b 03             	mov    rax,QWORD PTR [rbx]
 649:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
 64d:	75 f1                	jne    640 <__do_global_ctors_aux+0x20>
 64f:	48 83 c4 08          	add    rsp,0x8
 653:	5b                   	pop    rbx
 654:	c9                   	leave  
 655:	c3                   	ret    
 656:	90                   	nop
 657:	90                   	nop

Disassembly of section .fini:

0000000000000658 <_fini>:
 658:	48 83 ec 08          	sub    rsp,0x8
 65c:	e8 9f fe ff ff       	call   500 <__do_global_dtors_aux>
 661:	48 83 c4 08          	add    rsp,0x8
 665:	c3                   	ret    
