	.syntax unified
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_80A8FD8, 0x080A8FD8 + 1
	.section .text.sub_80375B4, "ax", %progbits
@ sub_80375B4 @ JP 0x080375B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80375B4
	.thumb_func
sub_80375B4:
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, r4, #0
	bl sub_8018E64
	cmp r0, #0xa
	bgt _080375CA
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_80A8FD8
_080375CA:
	pop {r4}
	pop {r0}
	bx r0

