	.syntax unified
	.set sub_803365C, 0x0803365C + 1
	.section .text.sub_801D180, "ax", %progbits
@ sub_801D180 @ JP 0x0801D180 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D180
	.thumb_func
sub_801D180:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801D1AC @ =0x0202BCEC
	ldrb r2, [r0, #0xf]
	cmp r4, #0
	beq _0801D1BA
	ldr r0, _0801D1B0 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801D1B6
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_803365C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D1B4
	movs r0, #4
	b _0801D204
	.align 2, 0
_0801D1AC: .4byte 0x0202BCEC
_0801D1B0: .4byte 0x0202BCAC
_0801D1B4:
	movs r2, #0
_0801D1B6:
	cmp r4, #0
	bne _0801D1BE
_0801D1BA:
	movs r0, #0
	b _0801D204
_0801D1BE:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, r2
	bne _0801D202
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0801D1E8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _0801D1EC
_0801D1E8:
	movs r0, #1
	b _0801D204
_0801D1EC:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _0801D202
	cmp r1, #4
	beq _0801D202
	movs r0, #2
	b _0801D204
_0801D202:
	movs r0, #3
_0801D204:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

