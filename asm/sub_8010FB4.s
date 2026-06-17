	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set sub_8011030, 0x08011030 + 1
	.section .text.sub_8010FB4, "ax", %progbits
@ EventShinningCursorAdvance @ JP 0x08010FB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EventShinningCursorAdvance
	.thumb_func
EventShinningCursorAdvance:
	push {r4, r5, lr}
	lsls r5, r2, #0x10
	lsrs r4, r5, #0x10
	lsls r0, r0, #0x14
	asrs r0, r0, #0x10
	lsls r1, r1, #0x14
	asrs r1, r1, #0x10
	ldr r3, _08011004 @ =0x0202BCAC
	ldrh r2, [r3, #0xc]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r3, #0xe]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	subs r2, #1
	ands r0, r2
	subs r2, #0xff
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08011008 @ =0x085B9F90
	ldr r3, _0801100C @ =0x00002822
	bl CallARM_PushToSecondaryOAM
	cmp r4, #0xf
	bhi _08011010
	lsrs r2, r5, #0x11
	movs r0, #0x10
	movs r1, #0
	bl sub_8011030
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08011028
	.align 2, 0
_08011004: .4byte 0x0202BCAC
_08011008: .4byte 0x085B9F90
_0801100C: .4byte 0x00002822
_08011010:
	lsrs r2, r5, #0x11
	subs r2, #8
	movs r0, #0
	movs r1, #0x10
	bl sub_8011030
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1f
	bls _08011028
	movs r4, #0
_08011028:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

