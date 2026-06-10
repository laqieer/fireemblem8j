	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_800FEA4, "ax", %progbits
@ sub_800FEA4 @ JP 0x0800FEA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800FEA4
	.thumb_func
sub_800FEA4:
	push {r4, r5, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	ands r2, r1
	ldrh r1, [r0, #2]
	ldrb r5, [r0, #2]
	lsrs r3, r1, #8
	cmp r2, #0
	beq _0800FEBE
	cmp r2, #1
	beq _0800FEDC
	b _0800FEE0
_0800FEBE:
	ldr r0, _0800FED8 @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800FEE4
	bl GetUnit
	adds r4, r0, #0
	b _0800FEE0
	.align 2, 0
_0800FED8: .4byte 0x0202E4D4
_0800FEDC:
	ldr r0, _0800FEEC @ =0x03004DF0
	ldr r4, [r0]
_0800FEE0:
	cmp r4, #0
	bne _0800FEF4
_0800FEE4:
	ldr r1, _0800FEF0 @ =0x030004B0
	movs r0, #0
	str r0, [r1, #0x30]
	b _0800FEFC
	.align 2, 0
_0800FEEC: .4byte 0x03004DF0
_0800FEF0: .4byte 0x030004B0
_0800FEF4:
	ldr r0, _0800FF04 @ =0x030004B0
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	str r1, [r0, #0x30]
_0800FEFC:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800FF04: .4byte 0x030004B0

