	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80664EC, "ax", %progbits
@ sub_80664EC @ JP 0x080664EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80664EC
	.thumb_func
sub_80664EC:
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _08066504 @ =0x08763AB0
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0
_08066504: .4byte 0x08763AB0

