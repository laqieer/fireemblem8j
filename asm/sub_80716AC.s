	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80716AC, "ax", %progbits
@ sub_80716AC @ JP 0x080716AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80716AC
	.thumb_func
sub_80716AC:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080716C2
	adds r0, r1, #0
	bl sub_8002DE4
_080716C2:
	pop {r0}
	bx r0
	.align 2, 0

