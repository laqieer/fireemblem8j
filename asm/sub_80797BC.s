	.syntax unified
	.set sub_8074E80, 0x08074E80 + 1
	.set sub_8079ED0, 0x08079ED0 + 1
	.section .text.sub_80797BC, "ax", %progbits
@ sub_80797BC @ JP 0x080797BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80797BC
	.thumb_func
sub_80797BC:
	push {lr}
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_8079ED0
	ldr r0, _080797DC @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
	pop {r0}
	bx r0
	.align 2, 0
_080797DC: .4byte 0x00000147

