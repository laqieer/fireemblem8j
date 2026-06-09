	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_803D3E0, 0x0803D3E0 + 1
	.section .text.sub_803F6BC, "ax", %progbits
@ sub_803F6BC @ JP 0x0803F6BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F6BC
	.thumb_func
sub_803F6BC:
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0803F710 @ =0x0203AA00
	adds r1, r0, #0
	adds r1, #0x86
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F706
	ldrb r0, [r1]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0803F714 @ =sub_803F610
	bl sub_803D3E0
	ldr r5, _0803F718 @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _0803F706
	ldr r0, _0803F71C @ =sub_803F648
	bl sub_803D3E0
	movs r0, #0xa
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _0803F706
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
_0803F706:
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803F710: .4byte 0x0203AA00
_0803F714: .4byte 0x0803F611  @ sub_803F610
_0803F718: .4byte 0x0203AA90
_0803F71C: .4byte 0x0803F649  @ sub_803F648

