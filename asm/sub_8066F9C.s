	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.section .text.sub_8066F9C, "ax", %progbits
@ sub_8066F9C @ JP 0x08066F9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066F9C
	.thumb_func
sub_8066F9C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _08066FCC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066FD0 @ =0x086019F8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8054BF8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066FCC: .4byte 0x0201774C
_08066FD0: .4byte 0x086019F8

