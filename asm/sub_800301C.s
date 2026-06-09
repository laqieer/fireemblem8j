	.syntax unified
	.set sub_8002FF4, 0x08002FF4 + 1
	.set sub_80D65D0, 0x080D65D0 + 1
	.section .text.sub_800301C, "ax", %progbits
@ sub_800301C @ JP 0x0800301C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800301C
	.thumb_func
sub_800301C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_80D65D0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08003032
	adds r1, r5, #0
	bl sub_8002FF4
_08003032:
	pop {r4, r5}
	pop {r0}
	bx r0

