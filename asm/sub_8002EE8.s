	.syntax unified
	.set sub_80D65D4, 0x080D65D4 + 1
	.section .text.sub_8002EE8, "ax", %progbits
@ sub_8002EE8 @ JP 0x08002EE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002EE8
	.thumb_func
sub_8002EE8:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _08002F0C @ =0x02024E68
	movs r5, #0x3f
_08002EF2:
	ldr r0, [r4]
	cmp r0, r7
	bne _08002EFE
	adds r0, r4, #0
	bl sub_80D65D4
_08002EFE:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08002EF2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F0C: .4byte 0x02024E68

