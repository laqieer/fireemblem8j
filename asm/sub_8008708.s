	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80081A0, 0x080081A0 + 1
	.section .text.sub_8008708, "ax", %progbits
@ sub_8008708 @ JP 0x08008708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008708
	.thumb_func
sub_8008708:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r2, r4, #0
	adds r2, #0x68
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r3, r4, #0
	adds r3, #0x6a
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl sub_80081A0
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

