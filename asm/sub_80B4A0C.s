	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B3B44, 0x080B3B44 + 1
	.set sub_80B3D00, 0x080B3D00 + 1
	.set sub_80B3D60, 0x080B3D60 + 1
	.section .text.sub_80B4A0C, "ax", %progbits
@ sub_80B4A0C @ JP 0x080B4A0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4A0C
	.thumb_func
sub_80B4A0C:
	push {lr}
	adds r3, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B4AA0
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B4A4C
	ldrh r2, [r3, #0x2c]
	ldr r1, _080B4A48 @ =0x08A9DDDC
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r2, r0
	blt _080B4A4C
	adds r0, r3, #0
	bl sub_80B3B44
	b _080B4AA0
	.align 2, 0
_080B4A48: .4byte 0x08A9DDDC
_080B4A4C:
	ldr r0, _080B4A64 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B4A68
	adds r0, r3, #0
	bl sub_80B3D00
	b _080B4AA0
	.align 2, 0
_080B4A64: .4byte 0x085775CC
_080B4A68:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080B4A78
	adds r0, r3, #0
	bl sub_80B3D60
	b _080B4AA0
_080B4A78:
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080B4A88
	adds r0, r3, #0
	bl sub_8002DE4
	b _080B4AA0
_080B4A88:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080B4AA0
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B4AA0
	adds r0, r3, #0
	movs r1, #3
	bl Proc_Goto
_080B4AA0:
	pop {r0}
	bx r0

