	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8067618, "ax", %progbits
@ sub_8067618 @ JP 0x08067618 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067618
	.thumb_func
sub_8067618:
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _08067630 @ =0x087A1C24
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0
_08067630: .4byte 0x087A1C24

