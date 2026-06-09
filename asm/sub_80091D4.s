	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8009320, 0x08009320 + 1
	.set sub_8009458, 0x08009458 + 1
	.section .text.sub_80091D4, "ax", %progbits
@ sub_80091D4 @ JP 0x080091D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80091D4
	.thumb_func
sub_80091D4:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r2, #0
	cmp r4, #0
	beq _08009226
	ldr r0, [r4]
	cmp r0, #0
	beq _08009226
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _080091FE
	adds r0, r4, #0
	bl sub_8009320
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	lsls r2, r0, #9
_080091FE:
	ldrh r0, [r4, #0x1e]
	orrs r2, r5
	ldr r3, [r4, #0x10]
	ldrh r1, [r4, #0x22]
	str r1, [sp]
	adds r1, r2, #0
	adds r2, r6, #0
	bl PutSpriteExt
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _08009226
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08009226
	adds r0, r4, #0
	bl sub_8009458
_08009226:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

