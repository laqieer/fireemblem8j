	.syntax unified
	.set sub_80D65D0, 0x080D65D0 + 1
	.section .text.sub_8002FF4, "ax", %progbits
@ sub_8002FF4 @ JP 0x08002FF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002FF4
	.thumb_func
sub_8002FF4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08003004
	bl sub_8002FF4
_08003004:
	adds r0, r4, #0
	bl sub_80D65D0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08003016
	adds r1, r5, #0
	bl sub_8002FF4
_08003016:
	pop {r4, r5}
	pop {r0}
	bx r0

