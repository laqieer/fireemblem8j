	.syntax unified
	.set sub_8018110, 0x08018110 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_80A90C8, 0x080A90C8 + 1
	.section .text.sub_803269C, "ax", %progbits
@ sub_803269C @ JP 0x0803269C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803269C
	.thumb_func
sub_803269C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8018E64
	cmp r0, #0
	bne _080326BA
	adds r0, r4, #0
	bl sub_8018110
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #6
	bl sub_80A90C8
_080326BA:
	pop {r4}
	pop {r0}
	bx r0

