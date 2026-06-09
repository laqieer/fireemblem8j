	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.section .text.sub_8070E1C, "ax", %progbits
@ sub_8070E1C @ JP 0x08070E1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070E1C
	.thumb_func
sub_8070E1C:
	push {r4, lr}
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08070E40
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _08070E52
_08070E40:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xa
	cmp r1, r0
	bne _08070E52
	adds r0, r4, #0
	bl sub_8002DE4
_08070E52:
	pop {r4}
	pop {r0}
	bx r0

