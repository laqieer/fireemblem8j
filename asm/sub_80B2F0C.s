	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80B2F0C, "ax", %progbits
@ sub_80B2F0C @ JP 0x080B2F0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2F0C
	.thumb_func
sub_80B2F0C:
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080B2F28 @ =0x020228A8
	ldr r2, _080B2F2C @ =0x01000100
	mov r0, sp
	bl sub_80D636C
	bl sub_8001EE4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B2F28: .4byte 0x020228A8
_080B2F2C: .4byte 0x01000100

