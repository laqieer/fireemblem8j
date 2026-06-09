	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80B9F7C, "ax", %progbits
@ sub_80B9F7C @ JP 0x080B9F7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9F7C
	.thumb_func
sub_80B9F7C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	bl sub_8000CD8
	movs r1, #0x28
	bl sub_80D637C
	movs r1, #8
	bl sub_80D6374
	lsls r0, r0, #1
	movs r1, #0
	cmp r4, #0
	bne _080B9FA6
	movs r1, #0x80
	lsls r1, r1, #6
_080B9FA6:
	orrs r1, r6
	ldr r3, _080B9FC0 @ =0x085B8D14
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9FC0: .4byte 0x085B8D14

