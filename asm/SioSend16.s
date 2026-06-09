	.syntax unified
	.section .text.SioSend16, "ax", %progbits
@ SioSend16 @ JP 0x080424EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioSend16
	.thumb_func
SioSend16:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08042504 @ =0x085D31E8
	ldr r3, [r0]
	movs r2, #6
	ldrsb r2, [r3, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08042508
	adds r0, r2, #0
	b _0804252A
	.align 2, 0
_08042504: .4byte 0x085D31E8
_08042508:
	ldr r2, _08042530 @ =0x04000128
	ldrh r0, [r4]
	strh r0, [r2, #2]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08042528
	cmp r1, #0
	bge _08042528
	ldr r0, _08042534 @ =0x030017D8
	ldrb r0, [r0]
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_08042528:
	movs r0, #0
_0804252A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08042530: .4byte 0x04000128
_08042534: .4byte 0x030017D8

