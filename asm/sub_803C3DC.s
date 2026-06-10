	.syntax unified
	.set CanUnitUseStaff, 0x0801654C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.section .text.sub_803C3DC, "ax", %progbits
@ sub_803C3DC @ JP 0x0803C3DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C3DC
	.thumb_func
sub_803C3DC:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_0803C3E2:
	lsls r0, r5, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803C418
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	beq _0803C412
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C412
	movs r0, #1
	b _0803C41A
_0803C412:
	adds r5, #1
	cmp r5, #4
	ble _0803C3E2
_0803C418:
	movs r0, #0
_0803C41A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

