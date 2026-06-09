	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8078D30, "ax", %progbits
@ sub_8078D30 @ JP 0x08078D30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078D30
	.thumb_func
sub_8078D30:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078D50 @ =0x088488EC
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08078D50: .4byte 0x088488EC

