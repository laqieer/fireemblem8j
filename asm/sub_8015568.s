	.syntax unified
	.set ClearFlag, 0x080860BC + 1
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8015568, "ax", %progbits
@ sub_8015568 @ JP 0x08015568 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015568
	.thumb_func
sub_8015568:
	push {r4, lr}
	movs r0, #0x84
	bl ClearFlag
	ldr r0, _080155A8 @ =0x0202BCEC
	adds r0, #0x4a
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080155A2
	movs r4, #1
_08015580:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801559C
	ldr r0, [r2]
	cmp r0, #0
	beq _0801559C
	ldr r0, [r2, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
_0801559C:
	adds r4, #1
	cmp r4, #0x3f
	ble _08015580
_080155A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080155A8: .4byte 0x0202BCEC

