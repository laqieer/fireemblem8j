	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set UnitDrop, 0x08018084 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8018110, 0x08018110 + 1
	.set sub_80181F4, 0x080181F4 + 1
	.set sub_8019040, 0x08019040 + 1
	.set sub_80A90C8, 0x080A90C8 + 1
	.section .text.sub_808598C, "ax", %progbits
@ sub_808598C @ JP 0x0808598C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808598C
	.thumb_func
sub_808598C:
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #1
_08085996:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08085A44
	ldr r0, [r4]
	cmp r0, #0
	beq _08085A44
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _08085A44
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08085A44
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #7
	bl sub_80A90C8
	adds r0, r4, #0
	bl sub_8018110
	adds r0, r4, #0
	movs r1, #0
	bl sub_8019040
	ldr r2, _08085A3C @ =0x0203A4E8
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _080859EA
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_080859EA:
	ldr r2, _08085A40 @ =0x0203A568
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _08085A02
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_08085A02:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08085A1A
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDrop
_08085A1A:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08085A4A
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl sub_80181F4
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDrop
	b _08085A4A
	.align 2, 0
_08085A3C: .4byte 0x0203A4E8
_08085A40: .4byte 0x0203A568
_08085A44:
	adds r5, #1
	cmp r5, #0x3f
	ble _08085996
_08085A4A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

