	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80CAEC0, "ax", %progbits
@ sub_80CAEC0 @ JP 0x080CAEC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CAEC0
	.thumb_func
sub_80CAEC0:
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _080CAEEC @ =0x02020188
	movs r6, #0
	movs r4, #3
_080CAECA:
	str r6, [sp]
	mov r0, sp
	adds r1, r5, #0
	ldr r2, _080CAEF0 @ =0x01000080
	bl sub_80D636C
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080CAECA
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CAEEC: .4byte 0x02020188
_080CAEF0: .4byte 0x01000080

