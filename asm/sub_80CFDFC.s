	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80CFDFC, "ax", %progbits
@ sub_80CFDFC @ JP 0x080CFDFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CFDFC
	.thumb_func
sub_80CFDFC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x3e
	mov r2, sb
	movs r3, #0x10
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080CFED0 @ =0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CFE68
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CFED4 @ =0x000001FF
	ands r1, r4
	ldr r5, _080CFED8 @ =0x08B3F690
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CFEDC @ =0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CFEE0 @ =0x00000838
	ldr r3, _080CFEE4 @ =0x08B3F6DE
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CFE68:
	movs r0, #0xb2
	movs r1, #1
	mov r2, sb
	movs r3, #0x10
	bl sub_80CF9D4
	adds r7, r0, #0
	cmp r7, sl
	beq _080CFEBA
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CFED4 @ =0x000001FF
	ands r1, r4
	ldr r5, _080CFED8 @ =0x08B3F690
	ldr r0, _080CFEE8 @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CFEEC @ =0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CFEE0 @ =0x00000838
	ldr r3, _080CFEE4 @ =0x08B3F6DE
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CFEBA:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x10
	bne _080CFEF0
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl sub_8002DE4
	b _080CFEF6
	.align 2, 0
_080CFED0: .4byte 0x0000FFFF
_080CFED4: .4byte 0x000001FF
_080CFED8: .4byte 0x08B3F690
_080CFEDC: .4byte 0x00001078
_080CFEE0: .4byte 0x00000838
_080CFEE4: .4byte 0x08B3F6DE
_080CFEE8: .4byte 0x000020F0
_080CFEEC: .4byte 0x00003168
_080CFEF0:
	adds r0, #1
	mov r1, r8
	strh r0, [r1, #0x2a]
_080CFEF6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

