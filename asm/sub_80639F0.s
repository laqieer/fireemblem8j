	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_80639F0, "ax", %progbits
@ sub_80639F0 @ JP 0x080639F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80639F0
	.thumb_func
sub_80639F0:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063A28 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063A2C @ =0x08600EE0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08063A30 @ =0x086B8D40
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #8
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063A28: .4byte 0x0201774C
_08063A2C: .4byte 0x08600EE0
_08063A30: .4byte 0x086B8D40

