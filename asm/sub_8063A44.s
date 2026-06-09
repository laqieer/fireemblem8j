	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8063A44, "ax", %progbits
@ sub_8063A44 @ JP 0x08063A44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063A44
	.thumb_func
sub_8063A44:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08063A60 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063A64 @ =0x08600F00
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063A60: .4byte 0x0201774C
_08063A64: .4byte 0x08600F00

