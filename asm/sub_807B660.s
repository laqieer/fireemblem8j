	.syntax unified
	.section .text.sub_807B660, "ax", %progbits
@ GetMuDisplayPosition @ JP 0x0807B660 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetMuDisplayPosition
	.thumb_func
GetMuDisplayPosition:
	push {r4, r5, lr}
	mov ip, r0
	adds r4, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #6
	bne _0807B69C
	mov r0, ip
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, ip
	adds r1, #0x50
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r4]
	mov r0, ip
	adds r0, #0x4e
	movs r5, #0
	ldrsh r0, [r0, r5]
	mov r1, ip
	adds r1, #0x52
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r4, #2]
	b _0807B704
_0807B69C:
	mov r0, ip
	adds r0, #0x4c
	movs r5, #0
	ldrsh r2, [r0, r5]
	adds r0, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r2, r0
	asrs r2, r2, #4
	ldr r3, _0807B700 @ =0x0202BCAC
	ldrh r0, [r3, #0xc]
	subs r2, r2, r0
	adds r2, #8
	mov r0, ip
	adds r0, #0x4e
	movs r5, #0
	ldrsh r0, [r0, r5]
	mov r1, ip
	adds r1, #0x52
	movs r5, #0
	ldrsh r1, [r1, r5]
	adds r0, r0, r1
	asrs r0, r0, #4
	ldrh r1, [r3, #0xe]
	subs r0, r0, r1
	adds r0, #8
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	lsls r1, r2, #0x10
	strh r2, [r4]
	adds r0, r3, #0
	adds r0, #8
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #0xd
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0807B6FA
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r3, r0
	blt _0807B6FA
	cmp r3, #0xb0
	ble _0807B704
_0807B6FA:
	movs r0, #0
	b _0807B706
	.align 2, 0
_0807B700: .4byte 0x0202BCAC
_0807B704:
	movs r0, #1
_0807B706:
	pop {r4, r5}
	pop {r1}
	bx r1

