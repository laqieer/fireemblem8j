	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_80976D0, 0x080976D0 + 1
	.section .text.sub_80976FC, "ax", %progbits
@ sub_80976FC @ JP 0x080976FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80976FC
	.thumb_func
sub_80976FC:
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_08097702:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809772A
	ldr r2, [r0]
	cmp r2, #0
	beq _0809772A
	ldr r0, [r0, #0xc]
	ldr r1, _08097738 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809772A
	ldrb r0, [r2, #4]
	bl sub_80976D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809772A
	adds r5, #1
_0809772A:
	adds r4, #1
	cmp r4, #0x3f
	ble _08097702
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08097738: .4byte 0x00010004

