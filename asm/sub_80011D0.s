	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80011D0, "ax", %progbits
@ sub_80011D0 @ JP 0x080011D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80011D0
	.thumb_func
sub_80011D0:
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	lsls r0, r1, #0x10
	adds r0, r0, r1
	str r0, [sp]
	ldr r2, _080011EC @ =0x01000200
	mov r0, sp
	adds r1, r3, #0
	bl sub_80D636C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080011EC: .4byte 0x01000200

