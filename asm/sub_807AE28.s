	.syntax unified
	.set AP_Create, 0x0800916C + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_807AE28, "ax", %progbits
@ sub_807AE28 @ JP 0x0807AE28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AE28
	.thumb_func
sub_807AE28:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0807AE68 @ =0x08A1E3D4
	ldr r1, _0807AE6C @ =0x06013000
	bl sub_8013008
	ldr r0, _0807AE70 @ =0x08A19580
	movs r1, #2
	bl AP_Create
	adds r4, r0, #0
	movs r0, #0x8c
	lsls r0, r0, #5
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl AP_SwitchAnimation
	ldr r0, _0807AE74 @ =0x08A12FF0
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x50]
	adds r5, #8
	str r5, [r0, #0x2c]
	subs r6, #4
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807AE68: .4byte 0x08A1E3D4
_0807AE6C: .4byte 0x06013000
_0807AE70: .4byte 0x08A19580
_0807AE74: .4byte 0x08A12FF0

