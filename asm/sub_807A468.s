	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_807A468, "ax", %progbits
@ sub_807A468 @ JP 0x0807A468 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A468
	.thumb_func
sub_807A468:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807A494 @ =0x0000037E
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
	bl sub_8056120
	ldr r0, _0807A498 @ =0x08855DC0
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A494: .4byte 0x0000037E
_0807A498: .4byte 0x08855DC0

