	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80CBD9C, "ax", %progbits
@ sub_80CBD9C @ JP 0x080CBD9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBD9C
	.thumb_func
sub_80CBD9C:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2a]
	cmp r0, #8
	bne _080CBDB2
	movs r0, #0
	strh r0, [r1, #0x2a]
	adds r0, r1, #0
	bl sub_8002DE4
	b _080CBDB6
_080CBDB2:
	adds r0, #1
	strh r0, [r1, #0x2a]
_080CBDB6:
	pop {r0}
	bx r0
	.align 2, 0

