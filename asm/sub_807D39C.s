	.syntax unified
	.set sub_808306C, 0x0808306C + 1
	.section .text.sub_807D39C, "ax", %progbits
@ sub_807D39C @ JP 0x0807D39C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D39C
	.thumb_func
sub_807D39C:
	push {lr}
	adds r2, r0, #0
	adds r2, #0x64
	ldrh r1, [r2]
	adds r1, #1
	movs r3, #0
	strh r1, [r2]
	adds r1, r0, #0
	adds r1, #0x66
	strh r3, [r1]
	ldr r1, [r0, #0x3c]
	ldr r2, [r0, #0x40]
	bl sub_808306C
	pop {r0}
	bx r0

