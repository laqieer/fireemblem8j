	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_804B1CC, "ax", %progbits
@ sub_804B1CC @ JP 0x0804B1CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B1CC
	.thumb_func
sub_804B1CC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B1E4 @ =0x085D4250
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B1E4: .4byte 0x085D4250

