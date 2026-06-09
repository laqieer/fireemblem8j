	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C8EE4, "ax", %progbits
@ sub_80C8EE4 @ JP 0x080C8EE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8EE4
	.thumb_func
sub_80C8EE4:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x34]
	subs r0, #1
	strh r0, [r2, #0x34]
	ldr r1, [r2, #0x14]
	ldr r0, [r1, #0x30]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	ldr r3, [r1, #0x40]
	cmp r0, r3
	blt _080C8F08
	str r3, [r1, #0x30]
	adds r0, r2, #0
	bl sub_8002DE4
	b _080C8F0A
_080C8F08:
	str r0, [r1, #0x30]
_080C8F0A:
	pop {r0}
	bx r0
	.align 2, 0

