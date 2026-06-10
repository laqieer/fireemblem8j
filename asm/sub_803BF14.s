	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_803BF14, "ax", %progbits
@ sub_803BF14 @ JP 0x0803BF14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803BF14
	.thumb_func
sub_803BF14:
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #1
_0803BF1C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0803BF50
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BF50
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0803BF50
	ldr r1, [r1, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803BF42
_0803BF3E:
	movs r0, #1
	b _0803BF58
_0803BF42:
	ldr r0, _0803BF4C @ =0x00010005
	ands r1, r0
	cmp r1, #0
	bne _0803BF56
	b _0803BF3E
	.align 2, 0
_0803BF4C: .4byte 0x00010005
_0803BF50:
	adds r4, #1
	cmp r4, #0xbf
	ble _0803BF1C
_0803BF56:
	movs r0, #0
_0803BF58:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

