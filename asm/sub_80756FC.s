	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80756FC, "ax", %progbits
@ sub_80756FC @ JP 0x080756FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80756FC
	.thumb_func
sub_80756FC:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08075718 @ =0x087A9798
	movs r1, #4
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075718: .4byte 0x087A9798

