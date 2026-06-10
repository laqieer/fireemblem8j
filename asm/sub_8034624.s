	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8027DE0, 0x08027DE0 + 1
	.section .text.sub_8034624, "ax", %progbits
@ sub_8034624 @ JP 0x08034624 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034624
	.thumb_func
sub_8034624:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _08034690 @ =0x080DCCC0
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x62
	lsls r0, r0, #3
	ldrb r2, [r2]
	adds r6, r0, r2
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	adds r0, #1
	lsls r5, r0, #3
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08034698
	bl sub_8000CD8
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _080346A6
	adds r1, r6, #0
	adds r1, #9
	adds r2, r5, #7
	ldr r3, _08034694 @ =0x085B8CDC
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	add r0, sp
	adds r0, #4
	ldrh r4, [r0]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	adds r0, #3
	str r0, [sp]
	movs r0, #2
	bl PutSprite
	b _080346A6
	.align 2, 0
_08034690: .4byte 0x080DCCC0
_08034694: .4byte 0x085B8CDC
_08034698:
	str r2, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_8027DE0
_080346A6:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

