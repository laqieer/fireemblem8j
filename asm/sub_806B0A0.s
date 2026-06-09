	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806B0A0, "ax", %progbits
@ sub_806B0A0 @ JP 0x0806B0A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806B0A0
	.thumb_func
sub_806B0A0:
	push {lr}
	ldr r1, _0806B0BC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806B0C0 @ =0x08602980
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
_0806B0BC: .4byte 0x0201774C
_0806B0C0: .4byte 0x08602980

