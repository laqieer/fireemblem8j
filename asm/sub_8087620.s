	.syntax unified
	.set sub_8018E64, 0x08018E64 + 1
	.section .text.sub_8087620, "ax", %progbits
@ sub_8087620 @ JP 0x08087620 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087620
	.thumb_func
sub_8087620:
	push {lr}
	ldr r0, _08087638 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8018E64
	movs r1, #0
	cmp r0, #0
	bne _08087632
	movs r1, #1
_08087632:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08087638: .4byte 0x03004DF0

