	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_804532C, "ax", %progbits
@ sub_804532C @ JP 0x0804532C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804532C
	.thumb_func
sub_804532C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	subs r2, #0x10
	ldr r3, _080453D4 @ =0x085D35EC
	adds r7, r5, #0
	adds r7, #0x43
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x48
	ldr r2, [r5, #0x34]
	subs r2, #6
	ldr r3, _080453D8 @ =0x085D35DC
	adds r6, r5, #0
	adds r6, #0x42
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x60
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _080453DC @ =0x080DEDC0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x40
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _080453E0 @ =0x080DEDDC
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _080453E4 @ =0x085D4AF4
	ldrb r4, [r6]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r5, #0x30]
	rsbs r0, r0, #0
	adds r4, r0, #0
	adds r4, #0x7c
	ldr r2, [r5, #0x34]
	ldr r3, _080453E8 @ =0x080DEDC8
	ldrb r0, [r6]
	cmp r0, #3
	beq _080453EC
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	b _080453EE
	.align 2, 0
_080453D4: .4byte 0x085D35EC
_080453D8: .4byte 0x085D35DC
_080453DC: .4byte 0x080DEDC0
_080453E0: .4byte 0x080DEDDC
_080453E4: .4byte 0x085D4AF4
_080453E8: .4byte 0x080DEDC8
_080453EC:
	movs r0, #0x40
_080453EE:
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _08045430 @ =0x080DEDE4
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045430: .4byte 0x080DEDE4

