	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8008908, 0x08008908 + 1
	.set sub_804F528, 0x0804F528 + 1
	.section .text.sub_80922F4, "ax", %progbits
@ sub_80922F4 @ JP 0x080922F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80922F4
	.thumb_func
sub_80922F4:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08092320 @ =0x085775CC
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #2
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _08092328
	ldr r0, _08092324 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809231A
	movs r0, #0x6b
	bl m4aSongNumStart
_0809231A:
	movs r0, #0
	b _08092348
	.align 2, 0
_08092320: .4byte 0x085775CC
_08092324: .4byte 0x0202BCEC
_08092328:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _08092358
	ldr r0, _08092354 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092344
	movs r0, #0x6a
	bl m4aSongNumStart
_08092344:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
_08092348:
	bl sub_8008908
	adds r0, r4, #0
	bl sub_8002DE4
	b _080923C2
	.align 2, 0
_08092354: .4byte 0x0202BCEC
_08092358:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0809237C
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	cmp r0, #2
	bne _0809237C
	ldr r0, _080923C8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809237A
	movs r0, #0x67
	bl m4aSongNumStart
_0809237A:
	strh r6, [r4, #0x2a]
_0809237C:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080923A6
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _080923A6
	ldr r0, _080923C8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080923A2
	movs r0, #0x67
	bl m4aSongNumStart
_080923A2:
	movs r0, #2
	strh r0, [r4, #0x2a]
_080923A6:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl sub_804F528
_080923C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080923C8: .4byte 0x0202BCEC

