	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set StartSubSpell_efxHazymoonOBJ3RND, 0x08061938 + 1
	.section .text.sub_80618D8, "ax", %progbits
@ efxHazymoonOBJ3_Loop @ JP 0x080618D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxHazymoonOBJ3_Loop
	.thumb_func
efxHazymoonOBJ3_Loop:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0806192A
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, _08061930 @ =0x086008A4
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsls r1, r0, #2
	adds r1, r1, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxHazymoonOBJ3RND
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0806192A
	ldr r1, _08061934 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0806192A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061930: .4byte 0x086008A4
_08061934: .4byte 0x0201774C

