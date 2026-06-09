	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806D988, "ax", %progbits
@ sub_806D988 @ JP 0x0806D988 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D988
	.thumb_func
sub_806D988:
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _0806D9A0 @ =0x087179EC
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0
_0806D9A0: .4byte 0x087179EC

