	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemUseEffect, 0x080174E4 + 1
	.section .text.sub_803C0F8, "ax", %progbits
@ sub_803C0F8 @ JP 0x0803C0F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C0F8
	.thumb_func
sub_803C0F8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r5, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803C11C
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _0803C11C
	movs r5, #0x40
_0803C11C:
	adds r0, r4, #0
	bl GetItemUseEffect
	cmp r0, #1
	blt _0803C136
	cmp r0, #5
	ble _0803C132
	cmp r0, #0x22
	bgt _0803C136
	cmp r0, #0x21
	blt _0803C136
_0803C132:
	movs r0, #4
	orrs r5, r0
_0803C136:
	ldrb r0, [r6, #0xa]
	orrs r5, r0
	strb r5, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

