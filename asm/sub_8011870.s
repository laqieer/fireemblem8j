	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_8011870, "ax", %progbits
@ sub_8011870 @ JP 0x08011870 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011870
	.thumb_func
sub_8011870:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r2, [r6, #0x38]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	ldr r4, _08011988 @ =0x0001FFFF
	ands r0, r4
	lsrs r0, r0, #5
	str r0, [sp, #4]
	ldr r1, [r6, #0x3c]
	adds r0, r1, #1
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	ldr r5, [sp, #4]
	orrs r5, r0
	str r5, [sp, #4]
	ands r2, r4
	lsrs r7, r2, #5
	ands r1, r3
	lsls r1, r1, #0xc
	orrs r7, r1
	ldr r1, [r6, #0x30]
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r0, [r4]
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	ldr r5, _0801198C @ =0x085B8D14
	str r7, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0x11
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	ldr r5, _08011990 @ =0x085B8CDC
	adds r0, r7, #6
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r5, #2
	b _080119B2
	.align 2, 0
_08011988: .4byte 0x0001FFFF
_0801198C: .4byte 0x085B8D14
_08011990: .4byte 0x085B8CDC
_08011994:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _080119F0 @ =0x085B8D14
	bl PutSpriteExt
	adds r5, #2
_080119B2:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _08011994
	ldr r0, [r6, #0x44]
	subs r0, #1
	movs r1, #0x48
	adds r1, r1, r6
	mov sl, r1
	cmp r5, r0
	bge _080119EC
_080119C8:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	mov r2, sl
	ldrh r0, [r2]
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _080119F4 @ =0x085B8CDC
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _080119C8
_080119EC:
	movs r5, #2
	b _08011A18
	.align 2, 0
_080119F0: .4byte 0x085B8D14
_080119F4: .4byte 0x085B8CDC
_080119F8:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xf
	str r0, [sp]
	movs r0, #4
	ldr r3, _08011AF8 @ =0x085B8D14
	bl PutSpriteExt
	adds r5, #2
_08011A18:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _080119F8
	movs r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	bge _08011A72
	mov sb, sl
	movs r0, #8
	adds r0, r0, r7
	mov r8, r0
_08011A32:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	ldr r3, _08011AF8 @ =0x085B8D14
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	ldr r3, _08011AF8 @ =0x085B8D14
	bl PutSpriteExt
	adds r5, #2
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _08011A32
_08011A72:
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	bge _08011ABE
	mov r8, sl
	ldr r1, _08011AFC @ =0x085B8CDC
	mov sb, r1
	adds r7, #8
_08011A82:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, sb
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, sb
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _08011A82
_08011ABE:
	ldr r4, [sp, #4]
	movs r7, #8
	movs r5, #2
_08011AC4:
	ldr r1, [r6, #0x30]
	adds r1, r1, r7
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r4, [sp]
	movs r0, #0
	ldr r3, _08011B00 @ =0x085B8D24
	bl PutSpriteExt
	adds r4, #4
	adds r7, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08011AC4
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011AF8: .4byte 0x085B8D14
_08011AFC: .4byte 0x085B8CDC
_08011B00: .4byte 0x085B8D24

