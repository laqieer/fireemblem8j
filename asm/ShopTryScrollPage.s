	.syntax unified
	.section .text.ShopTryScrollPage, "ax", %progbits
@ ShopTryScrollPage @ JP 0x080BA0B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ShopTryScrollPage
	.thumb_func
ShopTryScrollPage:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080BA0E0 @ =0x0203EFB0
	ldr r1, [r0]
	str r4, [r0]
	cmp r4, r1
	beq _080BA0F6
	cmp r2, r5
	bgt _080BA0F6
	cmp r4, r1
	bge _080BA0E4
	cmp r3, #0
	beq _080BA0F6
	subs r0, r4, r3
	cmp r0, #0
	bgt _080BA0F6
	movs r0, #1
	rsbs r0, r0, #0
	b _080BA0F8
	.align 2, 0
_080BA0E0: .4byte 0x0203EFB0
_080BA0E4:
	adds r0, r2, r3
	cmp r0, r5
	beq _080BA0F6
	subs r1, r4, r3
	subs r0, r2, #1
	cmp r1, r0
	blt _080BA0F6
	movs r0, #1
	b _080BA0F8
_080BA0F6:
	movs r0, #0
_080BA0F8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

