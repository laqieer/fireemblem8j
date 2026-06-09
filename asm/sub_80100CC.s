	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_801C7D8, 0x0801C7D8 + 1
	.set sub_801D730, 0x0801D730 + 1
	.section .text.sub_80100CC, "ax", %progbits
@ sub_80100CC @ JP 0x080100CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80100CC
	.thumb_func
sub_80100CC:
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x3c]
	lsrs r4, r0, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _080100E0
	movs r0, #0
	b _0801014C
_080100E0:
	ldr r2, [r1, #0x38]
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _080100F2
	cmp r1, #1
	beq _08010138
	b _0801014A
_080100F2:
	movs r1, #2
	ldrsh r0, [r2, r1]
	bl sub_800BF3C
	adds r4, r0, #0
	cmp r4, #0
	bne _08010104
	movs r0, #6
	b _0801014C
_08010104:
	ldr r0, _0801012C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08010116
	movs r0, #0x68
	bl m4aSongNumStart
_08010116:
	ldr r2, _08010130 @ =0x0300042C
	ldr r1, _08010134 @ =0x03004DF0
	ldr r0, [r1]
	str r0, [r2]
	str r4, [r1]
	bl sub_801D730
	adds r0, r4, #0
	bl sub_801C7D8
	b _0801014A
	.align 2, 0
_0801012C: .4byte 0x0202BCEC
_08010130: .4byte 0x0300042C
_08010134: .4byte 0x03004DF0
_08010138:
	bl sub_801D730
	ldr r2, _08010154 @ =0x0300042C
	ldr r1, [r2]
	cmp r1, #0
	beq _0801014A
	ldr r0, _08010158 @ =0x03004DF0
	str r1, [r0]
	str r4, [r2]
_0801014A:
	movs r0, #2
_0801014C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08010154: .4byte 0x0300042C
_08010158: .4byte 0x03004DF0

