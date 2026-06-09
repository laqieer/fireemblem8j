	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_805F530, "ax", %progbits
@ sub_805F530 @ JP 0x0805F530 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805F530
	.thumb_func
sub_805F530:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805F580 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F584 @ =0x085FF9C0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805F588 @ =0x08647890
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldrh r1, [r0, #2]
	adds r1, #0x18
	strh r1, [r0, #2]
	ldr r0, _0805F58C @ =0x0869D100
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0805F590 @ =0x08645794
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F580: .4byte 0x0201774C
_0805F584: .4byte 0x085FF9C0
_0805F588: .4byte 0x08647890
_0805F58C: .4byte 0x0869D100
_0805F590: .4byte 0x08645794

