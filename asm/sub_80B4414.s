	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set MusicProc4Exists, 0x080029BC + 1
	.section .text.sub_80B4414, "ax", %progbits
@ sub_80B4414 @ JP 0x080B4414 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4414
	.thumb_func
sub_80B4414:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	bne _080B4454
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	movs r0, #1
	strh r0, [r4, #0x2c]
	ldr r1, _080B4450 @ =0x08A9DDDC
	lsls r0, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	adds r3, r6, #0
	bl ChangeBgm
	movs r0, #1
	b _080B4456
	.align 2, 0
_080B4450: .4byte 0x08A9DDDC
_080B4454:
	movs r0, #0
_080B4456:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

