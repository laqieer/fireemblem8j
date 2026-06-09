	.syntax unified
	.set sub_80188EC, 0x080188EC + 1
	.section .text.sub_801D498, "ax", %progbits
@ sub_801D498 @ JP 0x0801D498 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D498
	.thumb_func
sub_801D498:
	push {r4, r5, lr}
	ldr r5, _0801D4F4 @ =0x03004DF0
	ldr r2, [r5]
	ldr r0, [r2]
	ldr r3, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801D4EC
	ldr r0, [r2, #0xc]
	ldr r1, _0801D4F8 @ =0x00010044
	ands r0, r1
	cmp r0, #0
	bne _0801D4EC
	ldr r4, _0801D4FC @ =0x0203A954
	ldrb r0, [r4, #0x11]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0801D4EC
	movs r0, #0x1d
	ldrsb r0, [r2, r0]
	movs r1, #0x12
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	ldrb r4, [r4, #0x10]
	cmp r0, r4
	ble _0801D4EC
	bl sub_80188EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D4EC
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r2, #0x40
	orrs r1, r2
	str r1, [r0, #0xc]
_0801D4EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D4F4: .4byte 0x03004DF0
_0801D4F8: .4byte 0x00010044
_0801D4FC: .4byte 0x0203A954

