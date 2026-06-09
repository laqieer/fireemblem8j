	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806E9A0, 0x0806E9A0 + 1
	.section .text.sub_806E974, "ax", %progbits
@ sub_806E974 @ JP 0x0806E974 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E974
	.thumb_func
sub_806E974:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806E992
	ldr r0, [r1, #0x5c]
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_806E9A0
	b _0806E99C
_0806E992:
	cmp r0, #0xa
	bne _0806E99C
	adds r0, r1, #0
	bl sub_8002DE4
_0806E99C:
	pop {r0}
	bx r0

