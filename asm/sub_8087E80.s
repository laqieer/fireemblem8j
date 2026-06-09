	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_8087E80, "ax", %progbits
@ sub_8087E80 @ JP 0x08087E80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087E80
	.thumb_func
sub_8087E80:
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	ldr r2, _08087EC4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r1]
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08087EC4: .4byte 0x03003020

