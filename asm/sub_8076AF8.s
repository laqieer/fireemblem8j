	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8076AF8, "ax", %progbits
@ sub_8076AF8 @ JP 0x08076AF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076AF8
	.thumb_func
sub_8076AF8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _08076B94 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r2, _08076B98 @ =0x0201FB38
	movs r1, #0
	adds r6, r2, #0
	ldr r4, _08076B9C @ =0x0201FC78
	ldr r0, _08076BA0 @ =0x0201FDC4
	ldr r5, _08076BA4 @ =0x0201FF04
	ldr r3, _08076BA8 @ =0x0201FB2C
	mov sl, r3
	ldr r7, _08076BAC @ =0x0201FDB8
	ldr r3, _08076BB0 @ =0x0201FB30
	mov ip, r3
	ldr r3, _08076BB4 @ =0x0201FDBC
	mov r8, r3
	ldr r3, _08076BB8 @ =0x0201FB34
	mov sb, r3
	movs r3, #0
_08076B2A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08076B2A
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_08076B3A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08076B3A
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_08076B4A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08076B4A
	adds r2, r5, #0
	movs r1, #0
	movs r3, #0
_08076B5A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08076B5A
	movs r4, #0
	mov r1, sl
	str r4, [r1]
	str r4, [r7]
	mov r3, ip
	str r6, [r3]
	mov r1, r8
	str r0, [r1]
	mov r3, sb
	str r6, [r3]
	ldr r1, _08076BBC @ =0x0201FDC0
	str r0, [r1]
	ldr r0, _08076BC0 @ =0x087A9990
	movs r1, #0
	bl sub_8002BCC
	strh r4, [r0, #0x2c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08076B94: .4byte 0x0201774C
_08076B98: .4byte 0x0201FB38
_08076B9C: .4byte 0x0201FC78
_08076BA0: .4byte 0x0201FDC4
_08076BA4: .4byte 0x0201FF04
_08076BA8: .4byte 0x0201FB2C
_08076BAC: .4byte 0x0201FDB8
_08076BB0: .4byte 0x0201FB30
_08076BB4: .4byte 0x0201FDBC
_08076BB8: .4byte 0x0201FB34
_08076BBC: .4byte 0x0201FDC0
_08076BC0: .4byte 0x087A9990

