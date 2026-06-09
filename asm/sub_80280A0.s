	.syntax unified
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_80280A0, "ax", %progbits
@ sub_80280A0 @ JP 0x080280A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80280A0
	.thumb_func
sub_80280A0:
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080280AC
	bl sub_8027144
_080280AC:
	ldr r2, [r4, #0x3c]
	cmp r2, #0
	beq _080280BE
	ldrb r1, [r2, #0xb]
	movs r3, #0x80
	rsbs r3, r3, #0
	adds r0, r3, #0
	orrs r0, r1
	strb r0, [r2, #0xb]
_080280BE:
	pop {r4}
	pop {r0}
	bx r0

