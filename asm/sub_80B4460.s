	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set MusicProc4Exists, 0x080029BC + 1
	.section .text.sub_80B4460, "ax", %progbits
@ sub_80B4460 @ JP 0x080B4460 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4460
	.thumb_func
sub_80B4460:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080B4490
	movs r4, #0
	strh r0, [r5, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x18
	bl ChangeBgm
	adds r0, r5, #0
	adds r0, #0x2f
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
_080B4490:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

