	.syntax unified
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A0AE0, "ax", %progbits
@ sub_80A0AE0 @ JP 0x080A0AE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A0AE0
	.thumb_func
sub_80A0AE0:
	push {lr}
	adds r0, #0x31
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
	pop {r0}
	bx r0
	.align 2, 0

