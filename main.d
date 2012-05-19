import std.stdio;
import test;

//From x86_64 System V EABI Spec...
//rdi - 1st arg
//rsi - 2nd arg
//rdx - 3rd arg or 2nd return reg
//rcx - 4th arg
//r8  - 5th arg
//r9  - 6th arg
//rax - 1st return reg

//ASM code appears to be generated correctly for small sized return values
//extern (C) void* test(void* p1, uint p2);
//0000000000401f18 <_Dmain>:
//  401f18:	55                   	push   rbp
//  401f19:	48 8b ec             	mov    rbp,rsp					//end of function prologue
//  401f1c:	48 b8 ef be ad de 00 	movabs rax,0xdeadbeef 			//rax = 0xdeadbeef (=p1)
//  401f23:	00 00 00 
//  401f26:	b9 64 00 00 00       	mov    ecx,0x64 				//ecx = 0x64 (=p2)
//  401f2b:	48 89 ce             	mov    rsi,rcx 					//rsi = rcx = ecx = p2
//  401f2e:	48 89 c7             	mov    rdi,rax 					//rdi = rax = p1
//  401f31:	e8 d2 fc ff ff       	call   401c08 <test@plt>		//test(rdi  = p1, rsi = p2 )

//This is the problem case...
//extern (C) TestStruct test(void* p1, uint p2);
//0000000000401f18 <_Dmain>:
//  401f18:	55                   	push   rbp
//  401f19:	48 8b ec             	mov    rbp,rsp					
//  401f1c:	48 83 ec 10          	sub    rsp,0x10 				//rsp -= 0x10 //reserve space for the return value 
																	//we can only allocate 8 byte chunks on the 64 bit stack
																	//hence we have to allocate 16 (0x10) bytes even though we 
																	//just need 12 (=TestStruct.sizeof)
//  401f20:	48 b8 ef be ad de 00 	movabs rax,0xdeadbeef 			//rax = 0xdeadbeef
//  401f27:	00 00 00 
//  401f2a:	b9 64 00 00 00       	mov    ecx,0x64 				//ecx = p2
//  401f2f:	48 89 ca             	mov    rdx,rcx   				//rdx = rcx = ecx = p2
//  401f32:	48 89 c6             	mov    rsi,rax 					//rsi = rax = p1
//  401f35:	48 8d 7d f0          	lea    rdi,[rbp-0x10]			//rdi = rbp-0x10 = retptr //BUG?
//  401f39:	e8 ca fc ff ff       	call   401c08 <test@plt> 		//test(rdi = retptr, rsi = p1, rdx = p2 )

//Dont know why the ASM code changed from above to the following (maybe optimisation failed?)!
//0000000000401f18 <_Dmain>:
//  401f18:	55                   	push   rbp
//  401f19:	48 8b ec             	mov    rbp,rsp					
//  401f1c:	48 83 ec 20          	sub    rsp,0x20 				//rsp -= 0x20 (=32)//reserve space for the locals and return value from test()
																	//32 = TestStruct.sizeof(=12) + (void*).sizeof(=8) + uint.sizeof (=4)
																	//It appears that the return value is directly stored in the TestStruct local var
																	//hence TestStruct is not allocated twice
//  401f20:	48 b8 ef be ad de 00 	movabs rax,0xdeadbeef 			//rax = 0xdeadbeef
//  401f27:	00 00 00 
//  401f2a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax //p1 = *(rbp-0x20) ~ rax ~ 0xdeadbeef
//  401f2e:	b9 64 00 00 00       	mov    ecx,0x64					//ecx = 0x64
//  401f33:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx //p2 = *(rbp-0x18) ~ ecx ~ 0x64
//  401f36:	48 89 ca             	mov    rdx,rcx					//rdx = rcx ~ ecx ~ p2
//  401f39:	48 89 c6             	mov    rsi,rax					//rsi = rax ~ p1
//  401f3c:	48 8d 7d f0          	lea    rdi,[rbp-0x10]			//rdi = *(rbp-0x10) ~ retptr?
//  401f40:	e8 c3 fc ff ff       	call   401c08 <test@plt>		//test(rdi = retptr, rsi = p1, rdx = p2)
//  401f45:	ff 35 7d 3f 02 00    	push   QWORD PTR [rip+0x23f7d]        # 425ec8 <_TMP0+0x8> //format string?
//  401f4b:	ff 35 6f 3f 02 00    	push   QWORD PTR [rip+0x23f6f]        # 425ec0 <_TMP0>
//  401f51:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10] //rsi = *retptr ~ ts.data
//  401f55:	8b 7d f8             	mov    edi,DWORD PTR [rbp-0x8]  //edi = *(retptr-0x8) ~ ts.flags
//  401f58:	e8 0b 00 00 00       	call   401f68 <_D3std5stdio22__T8writeflnTAyaTPvTkZ8writeflnFAyaPvkZv>
//  401f5d:	48 83 c4 10          	add    rsp,0x10
//  401f61:	31 c0                	xor    eax,eax
//  401f63:	c9                   	leave  
//  401f64:	c3                   	ret    
void main()
{
	void *p1 = cast(void*)0xDEADBEEF;
	uint p2 = 100;//0x64

	TestStruct ts = test.test(p1, p2);

	writefln("ts.data=%s\nts.flags=%s", ts.data, ts.flags);
}