	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804DD50, "ax", %progbits
@ sub_804DD50 @ JP 0x0804DD50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804DD50
	.thumb_func
sub_804DD50:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _0804DD74 @ =0x085D4BBC
	adds r1, r3, #0
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x2c]
	str r5, [r1, #0x30]
	adds r1, #0x4c
	movs r2, #0
	strh r2, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804DD74: .4byte 0x085D4BBC

