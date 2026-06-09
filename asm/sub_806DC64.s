	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_806DC64, "ax", %progbits
@ sub_806DC64 @ JP 0x0806DC64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806DC64
	.thumb_func
sub_806DC64:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r6, _0806DCA4 @ =0x020228A8
	ldr r5, _0806DCA8 @ =0x020165C8
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	str r0, [sp, #8]
	ldrh r0, [r6]
	strh r0, [r5]
	movs r4, #0
_0806DC92:
	subs r0, r4, #2
	cmp r0, #0x1c
	bhi _0806DD3E
	lsls r0, r0, #2
	ldr r1, _0806DCAC @ =_0806DCB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DCA4: .4byte 0x020228A8
_0806DCA8: .4byte 0x020165C8
_0806DCAC: .4byte _0806DCB0
_0806DCB0: @ jump table
	.4byte _0806DD24 @ case 0
	.4byte _0806DD24 @ case 1
	.4byte _0806DD3E @ case 2
	.4byte _0806DD3E @ case 3
	.4byte _0806DD3E @ case 4
	.4byte _0806DD3E @ case 5
	.4byte _0806DD3E @ case 6
	.4byte _0806DD3E @ case 7
	.4byte _0806DD3E @ case 8
	.4byte _0806DD3E @ case 9
	.4byte _0806DD3E @ case 10
	.4byte _0806DD3E @ case 11
	.4byte _0806DD3E @ case 12
	.4byte _0806DD3E @ case 13
	.4byte _0806DD24 @ case 14
	.4byte _0806DD3E @ case 15
	.4byte _0806DD3E @ case 16
	.4byte _0806DD3E @ case 17
	.4byte _0806DD3E @ case 18
	.4byte _0806DD24 @ case 19
	.4byte _0806DD24 @ case 20
	.4byte _0806DD3E @ case 21
	.4byte _0806DD3E @ case 22
	.4byte _0806DD3E @ case 23
	.4byte _0806DD3E @ case 24
	.4byte _0806DD24 @ case 25
	.4byte _0806DD24 @ case 26
	.4byte _0806DD24 @ case 27
	.4byte _0806DD24 @ case 28
_0806DD24:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #8
	bl sub_80D636C
	adds r6, #0x20
	adds r5, #0x20
	ldr r2, [sp, #4]
	adds r2, #0x4c
	mov r8, r2
	adds r4, #1
	mov sl, r4
	b _0806DDA2
_0806DD3E:
	adds r6, #2
	adds r5, #2
	ldr r3, [sp, #4]
	adds r3, #0x4c
	mov r8, r3
	adds r4, #1
	mov sl, r4
	movs r0, #0x1f
	mov sb, r0
	movs r7, #0x1f
	movs r0, #0x10
	ldr r1, [sp, #8]
	subs r4, r0, r1
	movs r2, #0xe
	mov ip, r2
_0806DD5C:
	ldrh r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, sb
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, sb
	ands r1, r0
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #4
	ands r0, r7
	lsls r0, r0, #0xa
	ands r2, r7
	lsls r2, r2, #5
	orrs r0, r2
	ands r3, r7
	orrs r3, r0
	strh r3, [r5]
	adds r6, #2
	adds r5, #2
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _0806DD5C
_0806DDA2:
	mov r4, sl
	cmp r4, #0x1f
	bgt _0806DDAA
	b _0806DC92
_0806DDAA:
	ldr r0, _0806DDD4 @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	bl sub_8001EF0
	mov r3, r8
	ldrh r1, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #0xc
	bne _0806DDD8
	movs r0, #0
	strh r0, [r3]
	ldr r0, [sp, #4]
	bl sub_8002DE4
	b _0806DDDE
	.align 2, 0
_0806DDD4: .4byte 0x020165C8
_0806DDD8:
	adds r0, r1, #1
	mov r3, r8
	strh r0, [r3]
_0806DDDE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

