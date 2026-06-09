	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_801254C, 0x0801254C + 1
	.section .text.sub_80124DC, "ax", %progbits
@ sub_80124DC @ JP 0x080124DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80124DC
	.thumb_func
sub_80124DC:
	push {r4, r5, lr}
	movs r4, #1
	movs r5, #1
	rsbs r5, r5, #0
_080124E4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801253A
	ldr r0, [r2]
	cmp r0, #0
	beq _0801253A
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0801253A
	ldr r0, _08012514 @ =0x00010008
	ands r0, r1
	cmp r0, #0
	beq _08012518
	movs r0, #0xff
	strb r0, [r2, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
	b _0801253A
	.align 2, 0
_08012514: .4byte 0x00010008
_08012518:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	ldr r0, _08012548 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801253A
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0801253A
	adds r0, r2, #0
	bl sub_801254C
_0801253A:
	adds r4, #1
	cmp r4, #0x3f
	ble _080124E4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012548: .4byte 0x0202BCAC

