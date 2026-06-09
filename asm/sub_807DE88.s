	.syntax unified
	.set MapAnim_DrawBarSegment, 0x0807DE58 + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_807DE88, "ax", %progbits
@ sub_807DE88 @ JP 0x0807DE88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807DE88
	.thumb_func
sub_807DE88:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r2, #0
	adds r7, r3, #0
	movs r2, #0
	ldr r4, [sp, #0x1c]
	b _0807DEA0
_0807DE98:
	subs r0, r2, #1
	ldrh r3, [r4]
	adds r2, r0, r3
	adds r4, #4
_0807DEA0:
	ldrh r0, [r4]
	cmp r0, #0
	bne _0807DE98
	adds r2, #1
	cmp r1, r5
	bne _0807DEB0
	str r2, [sp, #4]
	b _0807DEBC
_0807DEB0:
	lsls r0, r2, #8
	bl __divsi3
	muls r0, r5, r0
	asrs r0, r0, #8
	str r0, [sp, #4]
_0807DEBC:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0807DECA
	cmp r5, #0
	ble _0807DECA
	movs r0, #1
	str r0, [sp, #4]
_0807DECA:
	ldr r4, [sp, #0x1c]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0807DEF2
	ldr r1, _0807DEFC @ =0x08A13CF0
	lsls r0, r7, #2
	adds r5, r0, r1
_0807DED8:
	ldr r2, [r5]
	ldrh r3, [r4]
	ldrh r0, [r4, #2]
	str r0, [sp]
	adds r0, r6, #0
	add r1, sp, #4
	bl MapAnim_DrawBarSegment
	adds r6, #2
	adds r4, #4
	ldrh r0, [r4]
	cmp r0, #0
	bne _0807DED8
_0807DEF2:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DEFC: .4byte 0x08A13CF0

