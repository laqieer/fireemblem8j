	.syntax unified
	.section .text.SetBlendConfig, "ax", %progbits
@ SetBlendConfig @ JP 0x08001DF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetBlendConfig
	.thumb_func
SetBlendConfig:
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r4, _08001E1C @ =0x03003020
	mov ip, r4
	mov r6, ip
	adds r6, #0x3c
	lsrs r0, r0, #0xa
	ldrb r5, [r6]
	movs r4, #0x3f
	ands r4, r5
	orrs r4, r0
	strb r4, [r6]
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001E1C: .4byte 0x03003020

