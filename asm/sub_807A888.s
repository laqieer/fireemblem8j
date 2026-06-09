	.syntax unified
	.set GetUnitSpritePalette, 0x0802710C + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.set sub_807A964, 0x0807A964 + 1
	.section .text.sub_807A888, "ax", %progbits
@ sub_807A888 @ JP 0x0807A888 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A888
	.thumb_func
sub_807A888:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldrb r6, [r0, #4]
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0807A8C4
	ldrb r0, [r5, #0x1c]
	bl sub_802EAC4
	ldrb r0, [r0, #3]
	cmp r0, #0x36
	beq _0807A8BE
	cmp r0, #0x36
	bgt _0807A8B4
	cmp r0, #0x35
	beq _0807A8BA
	b _0807A8C4
_0807A8B4:
	cmp r0, #0x37
	beq _0807A8C2
	b _0807A8C4
_0807A8BA:
	movs r6, #0x67
	b _0807A8C4
_0807A8BE:
	movs r6, #0x68
	b _0807A8C4
_0807A8C2:
	movs r6, #0x69
_0807A8C4:
	adds r0, r5, #0
	bl GetUnitSpritePalette
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r6, #0
	movs r3, #1
	rsbs r3, r3, #0
	str r4, [sp]
	bl sub_807A964
	str r5, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x3e
	movs r1, #1
	strb r1, [r2]
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

