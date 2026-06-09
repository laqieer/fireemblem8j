	.syntax unified
	.set sub_8018110, 0x08018110 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_80A90C8, 0x080A90C8 + 1
	.section .text.sub_8032674, "ax", %progbits
@ sub_8032674 @ JP 0x08032674 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032674
	.thumb_func
sub_8032674:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8018E64
	cmp r0, #0
	bne _08032696
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	movs r2, #2
	bl sub_80A90C8
	adds r0, r4, #0
	bl sub_8018110
_08032696:
	pop {r4, r5}
	pop {r0}
	bx r0

