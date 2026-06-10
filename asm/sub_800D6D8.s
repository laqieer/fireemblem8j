	.syntax unified
	.set Proc_BlockEachMarked, 0x08002F3C + 1
	.set sub_8008E08, 0x08008E08 + 1
	.set sub_800D74C, 0x0800D74C + 1
	.set sub_8013DC0, 0x08013DC0 + 1
	.set sub_80BEEE8, 0x080BEEE8 + 1
	.set sub_80BF2B8, 0x080BF2B8 + 1
	.section .text.sub_800D6D8, "ax", %progbits
@ sub_800D6D8 @ JP 0x0800D6D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D6D8
	.thumb_func
sub_800D6D8:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	movs r1, #4
	orrs r1, r0
	strh r1, [r4, #0x3c]
	bl sub_8008E08
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D732
	bl sub_80BEEE8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0800D702
	adds r0, r4, #0
	bl sub_800D74C
	b _0800D732
_0800D702:
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800D732
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D71E
	adds r0, r4, #0
	bl sub_800D74C
	b _0800D726
_0800D71E:
	movs r0, #0x40
	adds r1, r4, #0
	bl sub_8013DC0
_0800D726:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
_0800D732:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800D740
	bl sub_80BF2B8
_0800D740:
	movs r0, #5
	bl Proc_BlockEachMarked
	pop {r4}
	pop {r0}
	bx r0

