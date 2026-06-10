	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set InitUnitStack, 0x08031610 + 1
	.set LoadPlayerUnitsFromUnitStack2, 0x080316A0 + 1
	.set PushUnit, 0x0803162C + 1
	.section .text.sub_803411C, "ax", %progbits
@ sub_803411C @ JP 0x0803411C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803411C
	.thumb_func
sub_803411C:
	push {r4, lr}
	ldr r0, _08034170 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803416A
	ldr r0, _08034174 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0803416A
	ldr r0, _08034178 @ =0x02020188
	bl InitUnitStack
	movs r4, #1
_0803413E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08034160
	ldr r0, [r2]
	cmp r0, #0
	beq _08034160
	ldr r0, [r2, #0xc]
	ldr r1, _0803417C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08034160
	adds r0, r2, #0
	bl PushUnit
_08034160:
	adds r4, #1
	cmp r4, #0x3f
	ble _0803413E
	bl LoadPlayerUnitsFromUnitStack2
_0803416A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034170: .4byte 0x0202BCEC
_08034174: .4byte 0x0202BCAC
_08034178: .4byte 0x02020188
_0803417C: .4byte 0x0001000C

