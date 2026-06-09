	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_806F1A4, "ax", %progbits
@ sub_806F1A4 @ JP 0x0806F1A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F1A4
	.thumb_func
sub_806F1A4:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806F1DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806F1E0 @ =0x08603574
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0806F1E4 @ =0x085FF1C0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F1DC: .4byte 0x0201774C
_0806F1E0: .4byte 0x08603574
_0806F1E4: .4byte 0x085FF1C0

