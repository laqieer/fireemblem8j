	.syntax unified
	.set sub_809C5EC, 0x0809C5EC + 1
	.section .text.sub_809AEA0, "ax", %progbits
@ sub_809AEA0 @ JP 0x0809AEA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809AEA0
	.thumb_func
sub_809AEA0:
	push {lr}
	sub sp, #4
	ldr r0, _0809AEBC @ =0x0000A840
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809C5EC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809AEBC: .4byte 0x0000A840

