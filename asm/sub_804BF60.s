	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_804A1CC, 0x0804A1CC + 1
	.set sub_804BA08, 0x0804BA08 + 1
	.section .text.sub_804BF60, "ax", %progbits
@ sub_804BF60 @ JP 0x0804BF60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BF60
	.thumb_func
sub_804BF60:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0804BFE4 @ =0x0300182C
	ldrb r0, [r0, #1]
	ldr r4, _0804BFE8 @ =0x0203DD91
	movs r1, #0x34
	adds r1, r1, r6
	mov r8, r1
	movs r1, #0x38
	adds r1, r1, r6
	mov sb, r1
	str r1, [sp]
	movs r1, #1
	adds r2, r4, #0
	mov r3, r8
	bl sub_804A1CC
	ldr r5, _0804BFEC @ =0x03001810
	subs r4, #5
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r7, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _0804BFC2
	adds r2, r6, #0
	adds r2, #0x2c
	adds r3, r6, #0
	adds r3, #0x30
	adds r0, r7, #0
	movs r1, #0
	bl sub_804BA08
_0804BFC2:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0804BFD6
	adds r0, r4, #0
	movs r1, #1
	mov r2, r8
	mov r3, sb
	bl sub_804BA08
_0804BFD6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFE4: .4byte 0x0300182C
_0804BFE8: .4byte 0x0203DD91
_0804BFEC: .4byte 0x03001810

