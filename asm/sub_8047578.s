	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8047578, "ax", %progbits
@ sub_8047578 @ JP 0x08047578 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047578
	.thumb_func
sub_8047578:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804758C @ =0x085D3CA0
	bl Proc_StartBlocking
	str r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804758C: .4byte 0x085D3CA0

