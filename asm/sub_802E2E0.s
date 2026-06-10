	.syntax unified
	.set AddTrap, 0x0802E1F0 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.section .text.sub_802E2E0, "ax", %progbits
@ sub_802E2E0 @ JP 0x0802E2E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E2E0
	.thumb_func
sub_802E2E0:
	push {r4, r5, r6, lr}
	ldr r0, _0802E314 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802E360
_0802E2EE:
	ldr r0, _0802E314 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0802E35A
_0802E2FC:
	ldr r0, _0802E318 @ =0x0202E4D8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802E31C
	cmp r0, #0x33
	beq _0802E348
	b _0802E354
	.align 2, 0
_0802E314: .4byte 0x0202E4D0
_0802E318: .4byte 0x0202E4D8
_0802E31C:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802E354
	ldr r0, _0802E344 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl AddTrap
	b _0802E354
	.align 2, 0
_0802E344: .4byte 0x0202BCEC
_0802E348:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0x14
	bl AddTrap
_0802E354:
	subs r4, #1
	cmp r4, #0
	bge _0802E2FC
_0802E35A:
	adds r5, r6, #0
	cmp r5, #0
	bge _0802E2EE
_0802E360:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

