	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80C318C, 0x080C318C + 1
	.section .text.sub_80C54CC, "ax", %progbits
@ GmTmConfront_StartAnim @ JP 0x080C54CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmTmConfront_StartAnim
	.thumb_func
GmTmConfront_StartAnim:
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _080C5570 @ =0x08B27240
	ldr r1, _080C5574 @ =0x06013000
	bl sub_8013008
	movs r5, #0
	movs r4, #0
	mov r6, sp
	adds r6, #0xa
_080C54E2:
	ldr r0, _080C5578 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r7, #0
	adds r1, #0x2e
	adds r1, r1, r4
	ldrb r1, [r1]
	add r2, sp, #8
	adds r3, r6, #0
	bl sub_80C318C
	add r0, sp, #8
	ldrh r0, [r0]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r4, #1
	cmp r4, #1
	ble _080C54E2
	lsrs r0, r0, #0x1f
	adds r0, r5, r0
	lsls r0, r0, #0xf
	asrs r5, r0, #0x10
	add r1, sp, #8
	ldr r2, _080C557C @ =0x03005270
	ldrh r0, [r2, #2]
	subs r0, r5, r0
	strh r0, [r1]
	ldrh r0, [r6]
	subs r0, #0xc
	ldrh r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _080C5554
	add r0, sp, #8
	ldrh r0, [r0]
	cmp r0, #0xef
	bhi _080C5554
	ldr r0, _080C5580 @ =0x08B2759C
	add r1, sp, #8
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r6, r3]
	movs r3, #0xe6
	lsls r3, r3, #6
	movs r4, #0
	str r4, [sp]
	movs r4, #7
	str r4, [sp, #4]
	bl sub_8009608
	str r0, [r7, #0x48]
_080C5554:
	ldr r0, _080C5584 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C5568
	movs r0, #0xc5
	lsls r0, r0, #2
	bl m4aSongNumStart
_080C5568:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5570: .4byte 0x08B27240
_080C5574: .4byte 0x06013000
_080C5578: .4byte 0x08AC1108
_080C557C: .4byte 0x03005270
_080C5580: .4byte 0x08B2759C
_080C5584: .4byte 0x0202BCEC

