	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_800BEA0, "ax", %progbits
@ sub_800BEA0 @ JP 0x0800BEA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800BEA0
	.thumb_func
sub_800BEA0:
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #1
_0800BEA8:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800BEC2
	ldr r0, [r0]
	cmp r0, #0
	beq _0800BEC2
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0800BEC2
	movs r0, #1
	b _0800BECA
_0800BEC2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800BEA8
	movs r0, #0
_0800BECA:
	pop {r4, r5}
	pop {r1}
	bx r1

