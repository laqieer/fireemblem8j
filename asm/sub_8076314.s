	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8076314, "ax", %progbits
@ sub_8076314 @ JP 0x08076314 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076314
	.thumb_func
sub_8076314:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r3, [r7, #0x44]
	ldr r5, [r7, #0x48]
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov sb, r0
	cmp r3, #0
	bge _08076334
	movs r3, #0
	b _0807633A
_08076334:
	cmp r3, #8
	ble _0807633A
	movs r3, #8
_0807633A:
	cmp r5, #0
	bge _08076342
	movs r5, #0
	b _08076348
_08076342:
	cmp r5, #8
	ble _08076348
	movs r5, #8
_08076348:
	cmp r6, #0
	bge _08076350
	movs r6, #0
	b _08076356
_08076350:
	cmp r6, #8
	ble _08076356
	movs r6, #8
_08076356:
	mov r2, sb
	cmp r2, #0
	bge _08076360
	movs r0, #0
	b _08076368
_08076360:
	mov r2, sb
	cmp r2, #8
	ble _0807636A
	movs r0, #8
_08076368:
	mov sb, r0
_0807636A:
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	ldr r0, [r7, #0x48]
	adds r0, #1
	str r0, [r7, #0x48]
	ldr r0, [r7, #0x4c]
	adds r0, #1
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	adds r0, #1
	str r0, [r7, #0x50]
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_8012E84
	mov r8, r0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	adds r3, r5, #0
	bl sub_8012E84
	mov sl, r0
	ldr r5, _08076428 @ =0x02020134
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	adds r3, r6, #0
	bl sub_8012E84
	strh r0, [r5]
	ldr r5, _0807642C @ =0x02020136
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	mov r3, sb
	bl sub_8012E84
	strh r0, [r5]
	ldr r0, _08076430 @ =0x03004920
	ldr r1, [r0]
	movs r0, #0x50
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r1, #0x36]
	ldr r0, _08076434 @ =0x020165C8
	ldr r4, _08076438 @ =0x020228A8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl sub_80D636C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	mov r3, sl
	bl sub_80737A4
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	mov r3, sl
	bl sub_80737A4
	bl sub_8001EE4
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08076416
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl sub_8002DE4
_08076416:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076428: .4byte 0x02020134
_0807642C: .4byte 0x02020136
_08076430: .4byte 0x03004920
_08076434: .4byte 0x020165C8
_08076438: .4byte 0x020228A8

