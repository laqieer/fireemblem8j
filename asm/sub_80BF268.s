	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_800D340, 0x0800D340 + 1
	.set sub_80BD548, 0x080BD548 + 1
	.set sub_80C4FC0, 0x080C4FC0 + 1
	.section .text.sub_80BF268, "ax", %progbits
@ sub_80BF268 @ JP 0x080BF268 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF268
	.thumb_func
sub_80BF268:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _080BF2B0 @ =0x08908060
	ldr r4, _080BF2B4 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _080BF2AA
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	movs r1, #0
	bl sub_800D340
	adds r0, r5, #0
	bl sub_80BD548
	movs r0, #0
	bl sub_80C4FC0
_080BF2AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF2B0: .4byte 0x08908060
_080BF2B4: .4byte 0x0202BCEC

