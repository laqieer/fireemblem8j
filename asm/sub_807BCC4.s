	.syntax unified
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set sub_801490C, 0x0801490C + 1
	.section .text.sub_807BCC4, "ax", %progbits
@ sub_807BCC4 @ JP 0x0807BCC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BCC4
	.thumb_func
sub_807BCC4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	movs r1, #4
	bl AP_SwitchAnimation
	ldr r1, [r4, #0x30]
	movs r0, #0
	strh r0, [r1, #0x18]
	ldr r1, [r4, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #0x1a]
	ldr r0, _0807BCF0 @ =sub_807BCF4
	ldr r1, [r4, #0x30]
	movs r2, #0x1e
	bl sub_801490C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BCF0: .4byte 0x0807BCF5  @ sub_807BCF4

