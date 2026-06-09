	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8064DFC, "ax", %progbits
@ sub_8064DFC @ JP 0x08064DFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064DFC
	.thumb_func
sub_8064DFC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08064E18 @ =0x086012B0
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064E18: .4byte 0x086012B0

