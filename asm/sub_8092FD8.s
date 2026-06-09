	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set IsUnitInCurrentRoster, 0x08097740 + 1
	.set sub_8092E20, 0x08092E20 + 1
	.section .text.sub_8092FD8, "ax", %progbits
@ sub_8092FD8 @ JP 0x08092FD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8092FD8
	.thumb_func
sub_8092FD8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0809301C @ =0x0200F158
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08093020
	movs r5, #1
_08092FEE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08093014
	ldr r0, [r4]
	cmp r0, #0
	beq _08093014
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093014
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8092E20
_08093014:
	adds r5, #1
	cmp r5, #0x3f
	ble _08092FEE
	b _0809304C
	.align 2, 0
_0809301C: .4byte 0x0200F158
_08093020:
	movs r4, #1
_08093022:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08093046
	ldr r0, [r2]
	cmp r0, #0
	beq _08093046
	ldr r0, [r2, #0xc]
	ldr r1, _08093054 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08093046
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_8092E20
_08093046:
	adds r4, #1
	cmp r4, #0x3f
	ble _08093022
_0809304C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093054: .4byte 0x0001000C

