	.syntax unified
	.section .text.ApplyWaterShadowsBmMap, "ax", %progbits
@ ApplyWaterShadowsBmMap @ JP 0x080192FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ApplyWaterShadowsBmMap
	.thumb_func
ApplyWaterShadowsBmMap:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	ldr r1, _080193D4 @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r1, r2]
	mov sb, r1
	cmp r6, r0
	blt _08019316
	b _08019442
_08019316:
	ldr r0, _080193D8 @ =0x085C2E54
	mov sl, r0
_0801931A:
	movs r4, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r1, r6, #1
	mov r8, r1
	cmp r4, r0
	blt _0801932A
	b _08019434
_0801932A:
	ldr r2, _080193DC @ =0x0202E4D8
	mov ip, r2
	lsls r3, r6, #2
	mov r7, sl
	movs r5, #0
_08019334:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0x3c
	bne _08019424
	movs r2, #0
	cmp r4, #0
	ble _08019366
	subs r0, r1, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08019354
	movs r2, #1
_08019354:
	cmp r0, #0x2d
	bne _0801935A
	movs r2, #1
_0801935A:
	cmp r0, #0x20
	bne _08019360
	movs r2, #1
_08019360:
	cmp r0, #0x21
	bne _08019366
	movs r2, #1
_08019366:
	cmp r6, #0
	ble _08019390
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0801937E
	adds r2, #2
_0801937E:
	cmp r0, #0x2d
	bne _08019384
	adds r2, #2
_08019384:
	cmp r0, #0x20
	bne _0801938A
	adds r2, #2
_0801938A:
	cmp r0, #0x21
	bne _08019390
	adds r2, #2
_08019390:
	cmp r4, #0
	ble _080193C4
	cmp r6, #0
	ble _080193C4
	mov r1, ip
	ldr r0, [r1]
	adds r1, r3, r0
	ldr r0, [r1]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _080193C4
	ldr r0, [r1, #4]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _080193C4
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _080193C4
	movs r2, #4
_080193C4:
	cmp r2, #2
	beq _080193F8
	cmp r2, #2
	bgt _080193E0
	cmp r2, #1
	beq _080193EA
	b _08019424
	.align 2, 0
_080193D4: .4byte 0x0202E4D0
_080193D8: .4byte 0x085C2E54
_080193DC: .4byte 0x0202E4D8
_080193E0:
	cmp r2, #3
	beq _08019406
	cmp r2, #4
	beq _08019414
	b _08019424
_080193EA:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb7
	lsls r2, r2, #2
	b _08019420
_080193F8:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb6
	lsls r2, r2, #2
	b _08019420
_08019406:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd6
	lsls r2, r2, #2
	b _08019420
_08019414:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd7
	lsls r2, r2, #2
_08019420:
	adds r1, r2, #0
	strh r1, [r0]
_08019424:
	adds r5, #2
	adds r4, #1
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _08019434
	b _08019334
_08019434:
	mov r6, r8
	mov r1, sb
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bge _08019442
	b _0801931A
_08019442:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

