	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_80C3744, 0x080C3744 + 1
	.set sub_80C3864, 0x080C3864 + 1
	.section .text.sub_80C3918, "ax", %progbits
@ sub_80C3918 @ JP 0x080C3918 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3918
	.thumb_func
sub_80C3918:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C392A
	cmp r0, #1
	beq _080C3960
	b _080C39A0
_080C392A:
	ldr r4, _080C3954 @ =0x0201BBD8
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C3958 @ =0x0201B718
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl j_TmFillRect
	ldr r1, _080C395C @ =0x08B1E73C
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r4, #0
	bl j_TmApplyTsa
	b _080C39A0
	.align 2, 0
_080C3954: .4byte 0x0201BBD8
_080C3958: .4byte 0x0201B718
_080C395C: .4byte 0x08B1E73C
_080C3960:
	ldr r5, _080C39B0 @ =0x0201BBD8
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
	ldr r4, _080C39B4 @ =0x0201B718
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
	ldr r1, _080C39B8 @ =0x08B1E7B8
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r5, #0
	bl j_TmApplyTsa
	adds r0, r6, #0
	adds r0, #0x34
	adds r4, #0xc8
	adds r1, r4, #0
	bl PutText
	adds r0, r6, #0
	bl sub_80C3864
	adds r0, r6, #0
	bl sub_80C3744
_080C39A0:
	adds r0, r6, #0
	adds r0, #0x2c
	ldr r1, _080C39BC @ =0x0201B71C
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C39B0: .4byte 0x0201BBD8
_080C39B4: .4byte 0x0201B718
_080C39B8: .4byte 0x08B1E7B8
_080C39BC: .4byte 0x0201B71C

