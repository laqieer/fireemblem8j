	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set ReadSuspendSave, 0x080AA62C + 1
	.set SetNextGameActionId, 0x08009EB0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set StartBgmVolumeChange, 0x08002680 + 1
	.set sub_80096A4, 0x080096A4 + 1
	.set sub_80A9B40, 0x080A9B40 + 1
	.section .text.sub_80AEA84, "ax", %progbits
@ sub_80AEA84 @ JP 0x080AEA84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEA84
	.thumb_func
sub_80AEA84:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080AEA92
	bl sub_80096A4
_080AEA92:
	ldr r0, [r4, #0x58]
	bl Proc_End
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r2, [r5]
	cmp r2, #0x20
	bne _080AEAD8
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #1
	beq _080AEAB8
	cmp r0, #0x10
	beq _080AEAC0
	b _080AEB4E
_080AEAB8:
	movs r0, #6
	bl SetNextGameActionId
	b _080AEB4E
_080AEAC0:
	movs r0, #0xd
	bl SetNextGameActionId
	ldr r2, _080AEAD4 @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2, #0x14]
	b _080AEB4E
	.align 2, 0
_080AEAD4: .4byte 0x0202BCEC
_080AEAD8:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080AEB4E
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080AEB10
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	ldrh r1, [r5]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AEB08
	movs r0, #0xb
	bl SetNextGameActionId
	b _080AEB4E
_080AEB08:
	movs r0, #5
	bl SetNextGameActionId
	b _080AEB4E
_080AEB10:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080AEB26
	movs r0, #3
	bl ReadSuspendSave
	movs r0, #4
	bl SetNextGameActionId
	b _080AEB4E
_080AEB26:
	movs r0, #0x82
	ands r0, r2
	cmp r0, #0
	beq _080AEB40
	adds r4, #0x2c
	ldrb r0, [r4]
	bl sub_80A9B40
	ldrb r0, [r4]
	adds r0, #1
	bl SetNextGameActionId
	b _080AEB4E
_080AEB40:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080AEB4E
	movs r0, #0
	bl SetNextGameActionId
_080AEB4E:
	pop {r4, r5}
	pop {r0}
	bx r0

