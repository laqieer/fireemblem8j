	.syntax unified
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set sub_802700C, 0x0802700C + 1
	.section .text.sub_807AAB8, "ax", %progbits
@ sub_807AAB8 @ JP 0x0807AAB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AAB8
	.thumb_func
sub_807AAB8:
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x42
	strb r1, [r3]
	cmp r1, #0xf
	bne _0807AAD2
	adds r0, #0x3c
	ldrb r0, [r0]
	ldr r1, [r2, #0x38]
	bl sub_802700C
	b _0807AADC
_0807AAD2:
	ldr r0, [r2, #0x30]
	movs r1, #0
	ldrsb r1, [r3, r1]
	bl AP_SwitchAnimation
_0807AADC:
	pop {r0}
	bx r0

