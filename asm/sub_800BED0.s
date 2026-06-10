	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_800BED0, "ax", %progbits
@ sub_800BED0 @ JP 0x0800BED0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800BED0
	.thumb_func
sub_800BED0:
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0800BED6:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800BEF8
	ldr r0, [r1]
	cmp r0, #0
	beq _0800BEF8
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BEF8
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0800BEF8:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800BED6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

