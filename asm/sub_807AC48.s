	.syntax unified
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_807AC48, "ax", %progbits
@ sub_807AC48 @ JP 0x0807AC48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AC48
	.thumb_func
sub_807AC48:
	push {lr}
	ldr r2, [r0, #0x5c]
	cmp r2, #0
	beq _0807AC5C
	adds r0, #0x66
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl sub_8014B50
_0807AC5C:
	pop {r0}
	bx r0

