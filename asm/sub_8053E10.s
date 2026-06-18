	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8053E10, "ax", %progbits
@ NewEfxDeadPika @ JP 0x08053E10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxDeadPika
	.thumb_func
NewEfxDeadPika:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08053E30 @ =0x085E395C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053E30: .4byte 0x085E395C

