	.syntax unified
	.set sub_80D65D4, 0x080D65D4 + 1
	.section .text.sub_8002EC0, "ax", %progbits
@ sub_8002EC0 @ JP 0x08002EC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002EC0
	.thumb_func
sub_8002EC0:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08002EE4 @ =0x02024E68
	movs r5, #0x3f
_08002EC8:
	ldr r0, [r4]
	cmp r0, #0
	beq _08002ED4
	adds r0, r4, #0
	bl sub_80D65D4
_08002ED4:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08002EC8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002EE4: .4byte 0x02024E68

