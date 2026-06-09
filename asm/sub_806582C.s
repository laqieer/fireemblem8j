	.syntax unified
	.section .text.sub_806582C, "ax", %progbits
@ sub_806582C @ JP 0x0806582C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806582C
	.thumb_func
sub_806582C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r0, _08065888 @ =0x0201FDB8
	ldr r0, [r0]
	ldr r4, _0806588C @ =0x0201FB38
	cmp r0, #0
	bne _08065842
	ldr r4, _08065890 @ =0x0201FC78
_08065842:
	ldr r3, _08065894 @ =0x0201FDC4
	cmp r0, #0
	bne _0806584A
	ldr r3, _08065898 @ =0x0201FF04
_0806584A:
	movs r2, #0
	movs r0, #0
	mov ip, r0
	movs r1, #0x80
	lsls r1, r1, #0x10
	mov sb, r1
	movs r6, #0x80
	ldr r5, _0806589C @ =0x08601530
_0806585A:
	cmp r2, #0x7f
	bhi _080658B4
	movs r7, #0
	ldrsh r1, [r5, r7]
	mov r7, r8
	ldr r0, [r7, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _080658AC
	cmp r2, #0x3f
	bhi _080658A4
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	bhs _080658AC
	ldr r1, _080658A0 @ =0x0000FF80
	adds r0, r2, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	b _080658AC
	.align 2, 0
_08065888: .4byte 0x0201FDB8
_0806588C: .4byte 0x0201FB38
_08065890: .4byte 0x0201FC78
_08065894: .4byte 0x0201FDC4
_08065898: .4byte 0x0201FF04
_0806589C: .4byte 0x08601530
_080658A0: .4byte 0x0000FF80
_080658A4:
	cmp r1, r6
	bls _080658AC
	mov r7, sb
	asrs r1, r7, #0x10
_080658AC:
	strh r1, [r4]
	adds r4, #2
	strh r1, [r3]
	b _080658BC
_080658B4:
	mov r0, ip
	strh r0, [r4]
	adds r4, #2
	strh r0, [r3]
_080658BC:
	adds r3, #2
	ldr r1, _080658D8 @ =0xFFFF0000
	add sb, r1
	subs r6, #1
	adds r5, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _0806585A
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080658D8: .4byte 0xFFFF0000

