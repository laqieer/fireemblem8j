	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80B1E04, "ax", %progbits
@ sub_80B1E04 @ JP 0x080B1E04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1E04
	.thumb_func
sub_80B1E04:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8000CD8
	ldr r1, _080B1EC4 @ =0x020228A8
	ldrh r2, [r5, #0x3a]
	lsls r2, r2, #5
	movs r3, #0x87
	lsls r3, r3, #2
	adds r2, r2, r3
	adds r2, r2, r1
	ldr r1, _080B1EC8 @ =0x0202BCEC
	adds r1, #0x41
	ldrb r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #4
	lsrs r0, r0, #2
	movs r4, #0xf
	ands r0, r4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080B1ECC @ =0x08A99EE0
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	bl sub_8001EE4
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080B1ED0 @ =0x085B8CDC
	ldrh r0, [r5, #0x3a]
	ands r4, r0
	lsls r4, r4, #0xc
	ldrh r0, [r5, #0x3c]
	adds r4, r4, r0
	ldrh r0, [r5, #0x36]
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r4, #1
	ldrh r3, [r5, #0x38]
	cmp r4, r3
	bge _080B1E92
_080B1E64:
	lsls r0, r4, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldrh r3, [r5, #0x3a]
	movs r0, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r3, [r5, #0x3c]
	adds r0, r0, r3
	ldrh r3, [r5, #0x36]
	adds r0, r0, r3
	adds r0, #1
	str r0, [sp]
	movs r0, #4
	ldr r3, _080B1ED0 @ =0x085B8CDC
	bl PutSpriteExt
	adds r4, #1
	ldrh r0, [r5, #0x38]
	cmp r4, r0
	blt _080B1E64
_080B1E92:
	ldrh r0, [r5, #0x38]
	lsls r0, r0, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080B1ED0 @ =0x085B8CDC
	ldrh r4, [r5, #0x3a]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	ldrh r4, [r5, #0x3c]
	adds r0, r0, r4
	ldrh r4, [r5, #0x36]
	adds r0, r0, r4
	adds r0, #2
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1EC4: .4byte 0x020228A8
_080B1EC8: .4byte 0x0202BCEC
_080B1ECC: .4byte 0x08A99EE0
_080B1ED0: .4byte 0x085B8CDC

