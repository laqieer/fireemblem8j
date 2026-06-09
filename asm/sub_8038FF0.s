	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8038FF0, "ax", %progbits
@ sub_8038FF0 @ JP 0x08038FF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8038FF0
	.thumb_func
sub_8038FF0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	bl GetBackgroundTileDataOffset
	str r0, [sp, #8]
	ldr r0, _0803903C @ =0x01000008
	mov sl, r0
	ldr r7, _08039040 @ =0x06012400
	ldr r6, _08039044 @ =0x06012000
	movs r1, #0
	mov sb, r1
	movs r0, #7
	mov r8, r0
_08039016:
	ldrh r0, [r5]
	ldr r1, _08039048 @ =0x0000FFFF
	cmp r0, r1
	bne _0803904C
	mov r0, sb
	str r0, [sp]
	mov r0, sp
	adds r1, r6, #0
	mov r2, sl
	bl sub_80D636C
	mov r1, sb
	str r1, [sp, #4]
	add r0, sp, #4
	adds r1, r7, #0
	mov r2, sl
	bl sub_80D636C
	b _08039072
	.align 2, 0
_0803903C: .4byte 0x01000008
_08039040: .4byte 0x06012400
_08039044: .4byte 0x06012000
_08039048: .4byte 0x0000FFFF
_0803904C:
	ldrh r4, [r5]
	lsls r4, r4, #6
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r4, r0
	ldr r1, [sp, #8]
	adds r4, r1, r4
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_80D636C
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #8
	bl sub_80D636C
_08039072:
	adds r5, #8
	adds r7, #0x20
	adds r6, #0x20
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _08039016
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

