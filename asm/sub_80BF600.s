	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80BF5B4, 0x080BF5B4 + 1
	.section .text.sub_80BF600, "ax", %progbits
@ sub_80BF600 @ JP 0x080BF600 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF600
	.thumb_func
sub_80BF600:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	strh r0, [r6, #0x36]
	strh r0, [r6, #0x34]
	strh r0, [r6, #0x3a]
	strh r0, [r6, #0x38]
	ldr r0, _080BF698 @ =0x08B085F8
	str r0, [r6, #0x3c]
	movs r0, #3
	bl sub_8001BC0
	str r0, [r6, #0x40]
	ldr r0, _080BF69C @ =0x08B1B2F8
	ldr r5, _080BF6A0 @ =0x020087A0
	adds r1, r5, #0
	bl sub_8013008
	str r5, [r6, #0x44]
	adds r0, r6, #0
	adds r0, #0x2c
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #3
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #3
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #3
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	ldr r0, _080BF6A4 @ =0x08B1B278
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x80
	bl sub_8000D68
	bl sub_8001EE4
	ldr r0, _080BF6A8 @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x3c]
	ldr r1, [r6, #0x40]
	ldr r2, [r6, #0x44]
	ldr r3, _080BF6AC @ =0x03001D50
	ldr r4, _080BF6B0 @ =0x03001D90
	str r4, [sp]
	bl sub_80BF5B4
	str r0, [r6, #0x48]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF698: .4byte 0x08B085F8
_080BF69C: .4byte 0x08B1B2F8
_080BF6A0: .4byte 0x020087A0
_080BF6A4: .4byte 0x08B1B278
_080BF6A8: .4byte 0x020244A8
_080BF6AC: .4byte 0x03001D50
_080BF6B0: .4byte 0x03001D90

