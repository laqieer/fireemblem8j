	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80C5784, "ax", %progbits
@ sub_80C5784 @ JP 0x080C5784 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5784
	.thumb_func
sub_80C5784:
	push {r4, r5, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	ldr r1, _080C57AC @ =0x0201B430
	ldr r5, _080C57B0 @ =0x01000140
	mov r0, sp
	adds r2, r5, #0
	bl sub_80D636C
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080C57B4 @ =0x0201B930
	adds r2, r5, #0
	bl sub_80D636C
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C57AC: .4byte 0x0201B430
_080C57B0: .4byte 0x01000140
_080C57B4: .4byte 0x0201B930

