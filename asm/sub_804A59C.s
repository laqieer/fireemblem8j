	.syntax unified
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80156F0, 0x080156F0 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_804A584, 0x0804A584 + 1
	.section .text.sub_804A59C, "ax", %progbits
@ sub_804A59C @ JP 0x0804A59C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A59C
	.thumb_func
sub_804A59C:
	push {lr}
	movs r0, #0
	bl sub_8001ACC
	bl sub_80156F0
	bl sub_80265CC
	bl sub_8026F38
	bl sub_804A584
	bl sub_80042E0
	ldr r1, _0804A5C4 @ =0x0203DD8C
	movs r0, #0xff
	strb r0, [r1, #3]
	pop {r0}
	bx r0
	.align 2, 0
_0804A5C4: .4byte 0x0203DD8C

