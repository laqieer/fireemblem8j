	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set efxMaohFlash_GetSideXOffset, 0x08069010 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_8069054, "ax", %progbits
@ sub_8069054 @ JP 0x08069054 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8069054
	.thumb_func
sub_8069054:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov sb, r3
	ldr r0, _080690CC @ =0x080E3B9C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080690D0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080690D4 @ =0x086023C8
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x5c]
	movs r1, #0
	strh r1, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	lsls r1, r7, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r5, r4, #0
	cmp r7, #0
	beq _080690D8
	adds r0, r7, #0
	bl efxMaohFlash_GetSideXOffset
	adds r0, #0xf0
	mov r1, r8
	subs r0, r0, r1
	b _080690E0
	.align 2, 0
_080690CC: .4byte 0x080E3B9C
_080690D0: .4byte 0x0201774C
_080690D4: .4byte 0x086023C8
_080690D8:
	movs r0, #0
	bl efxMaohFlash_GetSideXOffset
	add r0, r8
_080690E0:
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r1, [r6, #0x60]
	mov r2, sb
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r4, #4]
	strh r0, [r1, #4]
	ldrh r1, [r4, #8]
	ldr r0, _08069110 @ =0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069110: .4byte 0x0000F3FF

