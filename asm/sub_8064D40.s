	.syntax unified
	.section .text.sub_8064D40, "ax", %progbits
@ sub_8064D40 @ JP 0x08064D40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064D40
	.thumb_func
sub_8064D40:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r0, _08064DA4 @ =0x0201FDB8
	ldr r0, [r0]
	ldr r4, _08064DA8 @ =0x0201FB38
	cmp r0, #0
	bne _08064D56
	ldr r4, _08064DAC @ =0x0201FC78
_08064D56:
	ldr r2, _08064DB0 @ =0x0201FDC4
	cmp r0, #0
	bne _08064D5E
	ldr r2, _08064DB4 @ =0x0201FF04
_08064D5E:
	movs r3, #0
	movs r5, #0
	ldr r0, _08064DB8 @ =0x086012C8
	movs r1, #0xe0
	lsls r1, r1, #0xf
	mov ip, r1
	movs r7, #0x70
	mov sb, r7
	adds r6, r0, #0
	subs r6, #0x20
_08064D72:
	cmp r3, #0xf
	bls _08064DD0
	cmp r3, #0x6f
	bhi _08064DD0
	movs r0, #0
	ldrsh r1, [r6, r0]
	mov r7, r8
	ldr r0, [r7, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _08064DC8
	cmp r3, #0x3f
	bhi _08064DC0
	adds r0, r3, #0
	subs r0, #0x70
	cmp r1, r0
	bhs _08064DC8
	ldr r1, _08064DBC @ =0x0000FF90
	adds r0, r3, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	b _08064DC8
	.align 2, 0
_08064DA4: .4byte 0x0201FDB8
_08064DA8: .4byte 0x0201FB38
_08064DAC: .4byte 0x0201FC78
_08064DB0: .4byte 0x0201FDC4
_08064DB4: .4byte 0x0201FF04
_08064DB8: .4byte 0x086012C8
_08064DBC: .4byte 0x0000FF90
_08064DC0:
	cmp r1, sb
	bls _08064DC8
	mov r7, ip
	asrs r1, r7, #0x10
_08064DC8:
	strh r1, [r4]
	adds r4, #2
	strh r1, [r2]
	b _08064DD6
_08064DD0:
	strh r5, [r4]
	adds r4, #2
	strh r5, [r2]
_08064DD6:
	adds r2, #2
	ldr r0, _08064DF8 @ =0xFFFF0000
	add ip, r0
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	adds r6, #2
	adds r3, #1
	cmp r3, #0x9f
	bls _08064D72
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064DF8: .4byte 0xFFFF0000

