	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80B4D94, "ax", %progbits
@ sub_80B4D94 @ JP 0x080B4D94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4D94
	.thumb_func
sub_80B4D94:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	movs r6, #0
	movs r7, #0xd
	cmp r3, #0
	beq _080B4E02
	movs r0, #0xff
	ands r1, r0
	mov r8, r1
	cmp r4, #7
	ble _080B4DE4
	mov r5, sb
_080B4DB8:
	subs r4, #8
	ldr r1, _080B4E10 @ =0x000001FF
	ands r1, r5
	lsls r0, r7, #0xc
	ldr r2, _080B4E14 @ =0x00000847
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	ldr r3, _080B4E18 @ =0x085B8CDC
	bl PutSpriteExt
	adds r5, #8
	adds r6, #1
	cmp r6, #2
	ble _080B4DDA
	movs r7, #0xe
_080B4DDA:
	cmp r6, #4
	ble _080B4DE0
	movs r7, #0xf
_080B4DE0:
	cmp r4, #7
	bgt _080B4DB8
_080B4DE4:
	lsls r1, r6, #3
	add r1, sb
	ldr r0, _080B4E10 @ =0x000001FF
	ands r1, r0
	ldr r3, _080B4E18 @ =0x085B8CDC
	lsls r0, r7, #0xc
	adds r0, r4, r0
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	bl PutSpriteExt
_080B4E02:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4E10: .4byte 0x000001FF
_080B4E14: .4byte 0x00000847
_080B4E18: .4byte 0x085B8CDC

