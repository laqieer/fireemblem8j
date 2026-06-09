	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8049C7C, "ax", %progbits
@ sub_8049C7C @ JP 0x08049C7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049C7C
	.thumb_func
sub_8049C7C:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x3c]
	adds r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #0x14
	bls _08049C90
	adds r0, r1, #0
	bl sub_8002DE4
_08049C90:
	pop {r0}
	bx r0

