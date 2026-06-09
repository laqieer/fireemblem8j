	.syntax unified
	.set GetChapterMapChangesPointer, 0x0803458C + 1
	.section .text.sub_802E468, "ax", %progbits
@ sub_802E468 @ JP 0x0802E468 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E468
	.thumb_func
sub_802E468:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #1
	rsbs r6, r6, #0
	ldr r0, _0802E488 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterMapChangesPointer
	adds r1, r0, #0
	cmp r1, #0
	beq _0802E4BA
	b _0802E4B2
	.align 2, 0
_0802E488: .4byte 0x0202BCEC
_0802E48C:
	ldrb r2, [r1, #1]
	cmp r5, r2
	blt _0802E4B0
	ldrb r3, [r1, #2]
	cmp r4, r3
	blt _0802E4B0
	ldrb r0, [r1, #3]
	adds r0, r2, r0
	subs r0, #1
	cmp r0, r5
	blt _0802E4B0
	ldrb r0, [r1, #4]
	adds r0, r3, r0
	subs r0, #1
	cmp r0, r4
	blt _0802E4B0
	movs r6, #0
	ldrsb r6, [r1, r6]
_0802E4B0:
	adds r1, #0xc
_0802E4B2:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802E48C
_0802E4BA:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

