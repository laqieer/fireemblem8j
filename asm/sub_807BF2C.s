	.syntax unified
	.set AP_SetDefinition, 0x08009438 + 1
	.set GetMuImg, 0x0807B988 + 1
	.set GetMuImgBufById, 0x0807B96C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_807B99C, 0x0807B99C + 1
	.section .text.sub_807BF2C, "ax", %progbits
@ sub_807BF2C @ JP 0x0807BF2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BF2C
	.thumb_func
sub_807BF2C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r2, #0
	ldr r0, [r4, #0x30]
	movs r2, #0
	strh r2, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r2, [r0, #0x1a]
	adds r0, r4, #0
	adds r0, #0x41
	strb r1, [r0]
	ldr r5, [r4, #0x30]
	ldrb r0, [r0]
	bl sub_807B99C
	adds r1, r0, #0
	adds r0, r5, #0
	bl AP_SetDefinition
	adds r0, r4, #0
	bl GetMuImg
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0]
	bl GetMuImgBufById
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8013008
	ldr r0, [r4, #0x34]
	ldrb r1, [r0, #1]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r6, #0
	movs r2, #0x20
	bl sub_8000D68
	pop {r4, r5, r6}
	pop {r0}
	bx r0

