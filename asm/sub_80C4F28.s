	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set SetWorldMapHblankDest, 0x080C6B94 + 1
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_80C4B84, 0x080C4B84 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C4F28, "ax", %progbits
@ sub_80C4F28 @ JP 0x080C4F28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4F28
	.thumb_func
sub_80C4F28:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r0, r6
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x34]
	cmp r0, r1
	bge _080C4F7C
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	bl _DivArm1
	adds r5, r0, #0
	ldr r0, [r4, #0x3c]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x2a
	strb r1, [r0]
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x2b
	strb r1, [r0]
	b _080C4FB2
_080C4F7C:
	movs r0, #0
	movs r1, #0
	bl SetWorldMapHblankDest
	adds r5, r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080C4FB2:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80C4B84
	pop {r4, r5, r6}
	pop {r0}
	bx r0

