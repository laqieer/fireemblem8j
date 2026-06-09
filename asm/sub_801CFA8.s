	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8018454, 0x08018454 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8019994, 0x08019994 + 1
	.set sub_801CEA8, 0x0801CEA8 + 1
	.set sub_801DA28, 0x0801DA28 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_8085588, 0x08085588 + 1
	.set sub_80855A4, 0x080855A4 + 1
	.section .text.sub_801CFA8, "ax", %progbits
@ sub_801CFA8 @ JP 0x0801CFA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801CFA8
	.thumb_func
sub_801CFA8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801CFD8 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801CFE0
	bl sub_8019994
	ldr r1, _0801CFDC @ =0x0203A954
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl sub_8018454
	bl RefreshEntityBmMaps
	bl sub_8019914
	movs r0, #0
	bl sub_801DA28
	bl sub_8027144
	b _0801CFF2
	.align 2, 0
_0801CFD8: .4byte 0x0202BCEC
_0801CFDC: .4byte 0x0203A954
_0801CFE0:
	ldr r1, _0801D024 @ =0x0203A954
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl sub_8018454
	bl RefreshEntityBmMaps
	bl sub_8019914
_0801CFF2:
	ldr r4, _0801D028 @ =0x03004DF0
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
	ldr r2, _0801D02C @ =0x0202BCEC
	ldr r1, _0801D030 @ =0x0202BCAC
	ldrh r0, [r1, #0x14]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r2, #0x13]
	adds r0, r5, #0
	bl sub_801CEA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D034
	ldr r0, [r4]
	bl sub_80280A0
	b _0801D060
	.align 2, 0
_0801D024: .4byte 0x0203A954
_0801D028: .4byte 0x03004DF0
_0801D02C: .4byte 0x0202BCEC
_0801D030: .4byte 0x0202BCAC
_0801D034:
	bl sub_8085588
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D05C
	bl sub_807B4B8
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_80855A4
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _0801D060
_0801D05C:
	bl sub_807B4B8
_0801D060:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

