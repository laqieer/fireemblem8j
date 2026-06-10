	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80183E8, 0x080183E8 + 1
	.set sub_80188EC, 0x080188EC + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807AB0C, 0x0807AB0C + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_801CEA8, "ax", %progbits
@ sub_801CEA8 @ JP 0x0801CEA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801CEA8
	.thumb_func
sub_801CEA8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _0801CF00 @ =0x03004DF0
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0801CEFC
	ldr r0, [r3, #0xc]
	ldr r1, _0801CF04 @ =0x00010044
	ands r0, r1
	cmp r0, #0
	bne _0801CEFC
	ldr r0, _0801CF08 @ =0x0203A954
	ldrb r1, [r0, #0x11]
	adds r2, r0, #0
	cmp r1, #3
	bgt _0801CEDC
	cmp r1, #1
	bge _0801CEFC
_0801CEDC:
	ldr r1, [r4]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldrb r2, [r2, #0x10]
	cmp r0, r2
	ble _0801CEFC
	bl sub_80188EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CF0C
_0801CEFC:
	movs r0, #0
	b _0801CF5E
	.align 2, 0
_0801CF00: .4byte 0x03004DF0
_0801CF04: .4byte 0x00010044
_0801CF08: .4byte 0x0203A954
_0801CF0C:
	ldr r0, _0801CF4C @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, [r4]
	bl sub_80183E8
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	subs r1, #0x43
	ands r0, r1
	str r0, [r2, #0xc]
	bl sub_807B4B8
	ldr r0, [r4]
	bl sub_807A888
	bl sub_807AB0C
	ldr r0, _0801CF50 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801CF54
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0801CF5C
	.align 2, 0
_0801CF4C: .4byte 0x0202E4E0
_0801CF50: .4byte 0x0202BCEC
_0801CF54:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_0801CF5C:
	movs r0, #1
_0801CF5E:
	pop {r4, r5}
	pop {r1}
	bx r1

